#!/usr/bin/env python3
from __future__ import annotations

from dataclasses import dataclass
from decimal import Decimal, getcontext
from pathlib import Path
import argparse
import json
import re
import ssl
import subprocess
import sys
import urllib.parse
import urllib.request


@dataclass
class CoefficientRow:
    n: int
    m: int
    kind: str  # "g" or "h"
    values: list[str]


@dataclass
class IGRFDoc:
    file_name: str
    headers: list[str]
    header_numbers: list[str]
    epochs: list[str]
    coefficients: list[CoefficientRow]


ROOT = Path(__file__).resolve().parent
OUT_DIR = ROOT / "Sources" / "IGFRSwift" / "data"
INDEX_FILE = OUT_DIR / "IGRFData.swift"

ZENODO_API = "https://zenodo.org/api/records"
EXPECTED_LATEST_VERSION = 14
DEFAULT_CONTEXT = None
URL_CONTEXT = None

getcontext().prec = 28


def _init_ssl_context() -> None:
    global DEFAULT_CONTEXT
    if DEFAULT_CONTEXT is not None:
        return
    try:
        import certifi

        DEFAULT_CONTEXT = ssl.create_default_context(cafile=certifi.where())
    except Exception:
        DEFAULT_CONTEXT = ssl.create_default_context()


def _http_json(url: str) -> dict:
    req = urllib.request.Request(
        url,
        headers={"User-Agent": "IGFRSwift/1.0 (data fetch)"},
    )
    context = URL_CONTEXT if URL_CONTEXT is not None else DEFAULT_CONTEXT
    with urllib.request.urlopen(req, timeout=30, context=context) as resp:
        return json.loads(resp.read().decode("utf-8"))


def _http_text(url: str) -> str:
    req = urllib.request.Request(
        url,
        headers={"User-Agent": "IGFRSwift/1.0 (data fetch)"},
    )
    context = URL_CONTEXT if URL_CONTEXT is not None else DEFAULT_CONTEXT
    with urllib.request.urlopen(req, timeout=30, context=context) as resp:
        return resp.read().decode("utf-8")


def _zenodo_search(query: str, max_pages: int = 2) -> list[dict]:
    params = urllib.parse.urlencode({"q": query, "size": 25, "sort": "mostrecent"})
    url = f"{ZENODO_API}?{params}"
    hits: list[dict] = []
    pages = 0
    while url and pages < max_pages:
        data = _http_json(url)
        hits.extend(data.get("hits", {}).get("hits", []))
        url = data.get("links", {}).get("next")
        pages += 1
    return hits


def _latest_record(record: dict) -> dict:
    latest = record.get("links", {}).get("latest")
    if latest:
        return _http_json(latest)
    return record


def _extract_generation(title: str) -> int | None:
    match = re.search(r"IGRF[- ]?(\d+)", title, re.IGNORECASE)
    if not match:
        match = re.search(
            r"IGRF[^0-9]*(\d+)(?:st|nd|rd|th)", title, re.IGNORECASE
        )
    if not match:
        return None
    return int(match.group(1))


def _pick_coeffs_file(record: dict, generation: int) -> dict | None:
    files = record.get("files", [])
    if not files:
        return None
    exact = re.compile(rf"igrf{generation}coeffs\.txt$", re.IGNORECASE)
    loose = re.compile(rf"igrf{generation}.*\.txt$", re.IGNORECASE)
    for file_info in files:
        key = file_info.get("key", "")
        if exact.search(key):
            return file_info
    for file_info in files:
        key = file_info.get("key", "")
        if loose.search(key):
            return file_info
    return None


def _zenodo_igrf_records(latest_only: bool) -> dict[int, dict]:
    hits = _zenodo_search("\"International Geomagnetic Reference Field\"")
    candidates: list[tuple[int, dict]] = []
    for hit in hits:
        title = hit.get("metadata", {}).get("title", "")
        generation = _extract_generation(title)
        if generation is None:
            continue
        candidates.append((generation, hit))

    if not candidates:
        return {}

    records: dict[int, dict] = {}
    if latest_only:
        latest_generation = max(gen for gen, _ in candidates)
        best_hit = None
        for gen, hit in candidates:
            if gen != latest_generation:
                continue
            if best_hit is None or hit.get("updated", "") > best_hit.get("updated", ""):
                best_hit = hit
        if best_hit is None:
            return {}
        record = _latest_record(best_hit)
        title = record.get("metadata", {}).get("title", "")
        generation = _extract_generation(title)
        if generation is None:
            return {}
        file_info = _pick_coeffs_file(record, generation)
        if file_info is None:
            return {}
        record["_file_info"] = file_info
        records[generation] = record
        return records

    by_concept: dict[str, dict] = {}
    for gen, hit in candidates:
        concept = str(hit.get("conceptrecid") or hit.get("id"))
        existing = by_concept.get(concept)
        if existing is None or hit.get("updated", "") > existing.get("updated", ""):
            by_concept[concept] = hit

    for hit in by_concept.values():
        record = _latest_record(hit)
        title = record.get("metadata", {}).get("title", "")
        generation = _extract_generation(title)
        if generation is None:
            continue
        file_info = _pick_coeffs_file(record, generation)
        if file_info is None:
            continue
        existing = records.get(generation)
        if existing is None or record.get("updated", "") > existing.get(
            "updated", ""
        ):
            record["_file_info"] = file_info
            records[generation] = record
    return records


def _decimal_to_str(value: Decimal) -> str:
    text = format(value, "f")
    if "." in text:
        text = text.rstrip("0").rstrip(".")
    return text or "0"


def _parse_zenodo_text(text: str, file_name: str) -> IGRFDoc:
    headers: list[str] = []
    header_numbers: list[str] = []
    epochs: list[str] = []
    coefficients: list[CoefficientRow] = []

    lines = [line.rstrip() for line in text.splitlines()]
    non_comment: list[str] = []
    for line in lines:
        raw = line.strip()
        if not raw:
            continue
        if raw.startswith("#"):
            headers.append(raw.lstrip("#").strip())
            continue
        non_comment.append(raw)

    data_start = None
    for idx, line in enumerate(non_comment):
        lowered = line.lower()
        if lowered.startswith("g ") or lowered.startswith("h "):
            data_start = idx
            break
    if data_start is None:
        raise ValueError(f"No data rows found in {file_name}")

    header_lines = non_comment[:data_start]
    headers.extend(header_lines)

    if not header_lines:
        raise ValueError(f"Missing column header row in {file_name}")

    column_header = header_lines[-1]
    tokens = column_header.split()
    epoch_tokens: list[str] = []
    sv_token: str | None = None
    for token in tokens[3:]:
        if re.match(r"^\d{4}(?:\.\d+)?$", token):
            epoch_tokens.append(token)
        elif re.match(r"^\d{4}-\d{2}$", token):
            sv_token = token

    if not epoch_tokens:
        raise ValueError(f"Could not parse epochs in {file_name}")

    epochs = list(epoch_tokens)
    sv_year_start: int | None = None
    sv_year_end: int | None = None
    if sv_token:
        start, end_suffix = sv_token.split("-")
        sv_year_start = int(start)
        end_year = (sv_year_start // 100) * 100 + int(end_suffix)
        if end_year < sv_year_start:
            end_year += 100
        sv_year_end = end_year
        epochs.append(f"{float(end_year):.1f}")

    data_lines = non_comment[data_start:]
    for line in data_lines:
        parts = line.split()
        if len(parts) < 4:
            continue
        kind = parts[0].lower()
        if kind not in ("g", "h"):
            continue
        n = int(parts[1])
        m = int(parts[2])
        values = parts[3:]
        if sv_token:
            if len(values) != len(epoch_tokens) + 1:
                raise ValueError(
                    f"Unexpected value count for {file_name} n={n} m={m}"
                )
            base_values = [Decimal(v) for v in values[:-1]]
            sv_value = Decimal(values[-1])
            delta_years = Decimal(sv_year_end - sv_year_start)
            predicted = base_values[-1] + sv_value * delta_years
            values = [
                _decimal_to_str(v) for v in base_values
            ] + [_decimal_to_str(predicted)]
        coefficients.append(CoefficientRow(n=n, m=m, kind=kind, values=values))

    return IGRFDoc(
        file_name=file_name,
        headers=headers,
        header_numbers=header_numbers,
        epochs=epochs,
        coefficients=coefficients,
    )


def _swift_string(value: str) -> str:
    return (
        value.replace("\\", "\\\\")
        .replace('"', "\\\"")
        .replace("\n", "\\n")
    )


def _format_double_array(tokens: list[str], indent: str) -> str:
    if not tokens:
        return f"{indent}[]"
    per_line = 8
    lines: list[str] = [f"{indent}["]
    for i in range(0, len(tokens), per_line):
        chunk = ", ".join(tokens[i : i + per_line])
        if i + per_line < len(tokens):
            chunk += ","
        lines.append(f"{indent}    {chunk}")
    lines.append(f"{indent}]")
    return "\n".join(lines)


def _model_name(doc: IGRFDoc) -> str:
    match = re.search(r"(\d+)", doc.file_name)
    suffix = match.group(1) if match else doc.file_name
    return f"model{suffix}"


def _write_model_file(doc: IGRFDoc) -> None:
    model_name = _model_name(doc)
    file_name = f"IGRFDocument+{model_name}.swift"
    out_path = OUT_DIR / file_name
    lines: list[str] = []
    lines.append("import Foundation")
    lines.append("")
    lines.append("public extension IGRFDocument {")
    lines.append(f"    static let {model_name} = IGRFDocument(")
    lines.append(f"        fileName: \"{_swift_string(doc.file_name)}\",")
    if doc.headers:
        lines.append("        headers: [")
        for header in doc.headers:
            lines.append(f"            \"{_swift_string(header)}\",")
        lines.append("        ],")
    else:
        lines.append("        headers: [],")
    lines.append(
        "        headerNumbers: "
        + _format_double_array(doc.header_numbers, "        ")
        + ","
    )
    lines.append(
        "        epochs: " + _format_double_array(doc.epochs, "        ") + ","
    )
    lines.append("        coefficients: [")
    for row in doc.coefficients:
        lines.append("            IGRFCoefficient(")
        lines.append(f"                n: {row.n},")
        lines.append(f"                m: {row.m},")
        lines.append(f"                kind: .{row.kind},")
        lines.append(
            "                values: "
            + _format_double_array(row.values, "                ")
        )
        lines.append("            ),")
    lines.append("        ]")
    lines.append("    )")
    lines.append("}")
    out_path.write_text("\n".join(lines) + "\n", encoding="utf-8")


def _write_index_file(docs: list[IGRFDoc]) -> None:
    lines: list[str] = []
    lines.append("import Foundation")
    lines.append("")
    lines.append("public enum IGRFData {")
    lines.append("    public static let documents: [IGRFDocument] = [")
    for doc in docs:
        lines.append(f"        .{_model_name(doc)},")
    lines.append("    ]")
    lines.append("}")
    INDEX_FILE.write_text("\n".join(lines) + "\n", encoding="utf-8")


def _clean_output() -> None:
    if not OUT_DIR.exists():
        return
    for path in OUT_DIR.glob("IGRFDocument+model*.swift"):
        path.unlink()
    if INDEX_FILE.exists():
        INDEX_FILE.unlink()


def _write_swift(docs: list[IGRFDoc]) -> None:
    OUT_DIR.mkdir(parents=True, exist_ok=True)
    _clean_output()
    for doc in docs:
        _write_model_file(doc)
    _write_index_file(docs)


def _run_swift_format() -> None:
    swift_files = sorted(str(path) for path in OUT_DIR.glob("*.swift"))
    if not swift_files:
        return
    subprocess.run(
        ["swift-format", "format", "-i", *swift_files],
        check=True,
    )


def _parse_args(argv: list[str]) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Generate IGRF Swift data.")
    parser.add_argument(
        "--expect-latest",
        type=int,
        default=EXPECTED_LATEST_VERSION,
        help="Expected latest IGRF generation number.",
    )
    parser.add_argument(
        "--latest-only",
        action="store_true",
        help="Generate only the latest IGRF model found on Zenodo.",
    )
    parser.add_argument(
        "--insecure",
        action="store_true",
        help="Disable TLS verification (only if your local cert store is broken).",
    )
    return parser.parse_args(argv)


def main() -> None:
    args = _parse_args(sys.argv[1:])
    _init_ssl_context()
    global URL_CONTEXT
    if args.insecure:
        URL_CONTEXT = ssl._create_unverified_context()
    records = _zenodo_igrf_records(args.latest_only)
    if not records:
        raise SystemExit("No IGRF records found on Zenodo.")

    generations = sorted(records)
    latest = generations[-1]
    if latest != args.expect_latest:
        raise SystemExit(
            f"Latest IGRF generation on Zenodo is {latest}, "
            f"expected {args.expect_latest}. Update --expect-latest if needed."
        )

    if args.latest_only:
        generations = [latest]

    docs: list[IGRFDoc] = []
    for generation in generations:
        record = records[generation]
        file_info = record.get("_file_info")
        if not file_info:
            continue
        file_name = file_info.get("key", f"IGRF{generation}.txt")
        links = file_info.get("links", {})
        download_url = links.get("download") or links.get("self")
        if not download_url:
            raise SystemExit(f"Missing download link for {file_name}")
        text = _http_text(download_url)
        docs.append(_parse_zenodo_text(text, file_name))

    if not docs:
        raise SystemExit("No coefficient files downloaded from Zenodo.")

    _write_swift(docs)
    _run_swift_format()


if __name__ == "__main__":
    main()
