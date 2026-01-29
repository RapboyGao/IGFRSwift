#!/usr/bin/env python3
from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path
import re


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
DOCS_DIR = ROOT / "Sources" / "IGFRSwift" / "Resources" / "igrf_docs"
OUT_DIR = ROOT / "Sources" / "IGFRSwift" / "data"
INDEX_FILE = OUT_DIR / "IGRFData.swift"


def _sorted_docs(paths: list[Path]) -> list[Path]:
    def key(p: Path) -> tuple[int, str]:
        match = re.search(r"(\d+)", p.stem)
        num = int(match.group(1)) if match else 0
        return (num, p.name)

    return sorted(paths, key=key)


def _parse_doc(path: Path) -> IGRFDoc:
    headers: list[str] = []
    header_numbers: list[str] = []
    epochs: list[str] = []
    coefficients: list[CoefficientRow] = []

    counts: dict[tuple[int, int], int] = {}
    lines = path.read_text(encoding="utf-8").splitlines()
    i = 0
    while i < len(lines):
        raw = lines[i].strip()
        if not raw:
            i += 1
            continue
        if raw.startswith("#"):
            headers.append(raw.lstrip("#").strip())
            i += 1
            continue
        # First non-header line is the numeric header.
        header_numbers = raw.split()
        i += 1
        break

    while i < len(lines):
        raw = lines[i].strip()
        if raw:
            epochs = raw.split()
            i += 1
            break
        i += 1

    while i < len(lines):
        raw = lines[i].strip()
        i += 1
        if not raw:
            continue
        parts = raw.split()
        if len(parts) < 3:
            continue
        n = int(parts[0])
        m = int(parts[1])
        values = parts[2:]
        if m == 0:
            kind = "g"
        else:
            key = (n, m)
            count = counts.get(key, 0)
            kind = "g" if count == 0 else "h"
            counts[key] = count + 1
        coefficients.append(CoefficientRow(n=n, m=m, kind=kind, values=values))

    return IGRFDoc(
        file_name=path.name,
        headers=headers,
        header_numbers=header_numbers,
        epochs=epochs,
        coefficients=coefficients,
    )


def _swift_string(value: str) -> str:
    return (
        value.replace("\\", "\\\\")
        .replace("\"", "\\\"")
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
        "        epochs: "
        + _format_double_array(doc.epochs, "        ")
        + ","
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


def _write_swift(docs: list[IGRFDoc]) -> None:
    OUT_DIR.mkdir(parents=True, exist_ok=True)
    for doc in docs:
        _write_model_file(doc)
    _write_index_file(docs)


def main() -> None:
    if not DOCS_DIR.exists():
        raise SystemExit(f"Missing docs directory: {DOCS_DIR}")
    docs = [_parse_doc(p) for p in _sorted_docs(list(DOCS_DIR.glob("*.txt")))]
    _write_swift(docs)


if __name__ == "__main__":
    main()
