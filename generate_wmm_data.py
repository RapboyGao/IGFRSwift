#!/usr/bin/env python3
from __future__ import annotations

from dataclasses import dataclass
from decimal import Decimal, getcontext
from io import BytesIO
from pathlib import Path
import re
import ssl
import time
import urllib.error
import urllib.request
import zipfile


@dataclass
class CoefficientRow:
    n: int
    m: int
    kind: str  # "g" or "h"
    values: list[str]


@dataclass
class WMMDoc:
    file_name: str
    header: str
    epoch: Decimal
    coefficients: list[CoefficientRow]


ROOT = Path(__file__).resolve().parent
OUT_DIR = ROOT / "Sources" / "GeoMagSwift" / "models"

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


def _http_bytes(url: str, retries: int = 3, backoff: float = 1.0) -> bytes:
    req = urllib.request.Request(
        url,
        headers={"User-Agent": "GeoMagSwift/1.0 (data fetch)"},
    )
    context = URL_CONTEXT if URL_CONTEXT is not None else DEFAULT_CONTEXT
    last_err: Exception | None = None
    for attempt in range(retries):
        try:
            with urllib.request.urlopen(req, timeout=30, context=context) as resp:
                return resp.read()
        except (urllib.error.URLError, ssl.SSLError) as err:
            last_err = err
            if attempt < retries - 1:
                time.sleep(backoff * (2 ** attempt))
                continue
            raise
    raise urllib.error.URLError(last_err or "unknown error")


def _decimal_to_str(value: Decimal) -> str:
    text = format(value, "f")
    if "." in text:
        text = text.rstrip("0").rstrip(".")
    return text or "0"


def _parse_wmm_cof(text: str, file_name: str) -> WMMDoc:
    lines = [line.rstrip() for line in text.splitlines() if line.strip()]
    if not lines:
        raise ValueError(f"Empty WMM COF in {file_name}")

    header = lines[0].strip()
    header_parts = header.split()
    if not header_parts:
        raise ValueError(f"Missing header in {file_name}")

    epoch = Decimal(header_parts[0])
    coefficients: list[CoefficientRow] = []

    for line in lines[1:]:
        if line.startswith("9999"):
            break
        parts = line.split()
        if len(parts) < 6:
            continue
        n = int(parts[0])
        m = int(parts[1])
        g = Decimal(parts[2])
        h = Decimal(parts[3])
        g_dot = Decimal(parts[4])
        h_dot = Decimal(parts[5])

        g_next = g + g_dot * Decimal(5)
        h_next = h + h_dot * Decimal(5)

        coefficients.append(
            CoefficientRow(
                n=n,
                m=m,
                kind="g",
                values=[_decimal_to_str(g), _decimal_to_str(g_next)],
            )
        )
        coefficients.append(
            CoefficientRow(
                n=n,
                m=m,
                kind="h",
                values=[_decimal_to_str(h), _decimal_to_str(h_next)],
            )
        )

    if not coefficients:
        raise ValueError(f"No coefficients found in {file_name}")

    return WMMDoc(
        file_name=file_name,
        header=header,
        epoch=epoch,
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


def _model_name(version: int) -> str:
    return f"wmm{version}"


def _write_model_file(doc: WMMDoc, version: int) -> None:
    model_name = _model_name(version)
    file_name = f"SHCModel+{model_name}.swift"
    out_path = OUT_DIR / file_name
    epoch_str = _decimal_to_str(doc.epoch)
    epoch_next = _decimal_to_str(doc.epoch + Decimal(5))
    lines: list[str] = []
    lines.append("import Foundation")
    lines.append("")
    lines.append("public extension SHCModel {")
    # 添加详细的中英文注释
    lines.append(f"    /// 世界地磁模型 (WMM{version}) 模型")
    lines.append("    ///")
    lines.append(f"    /// World Magnetic Model (WMM{version}) model")
    lines.append("    ///")
    lines.append("    /// 该模型是由美国国家环境信息中心 (NCEI) 和英国地质调查局 (BGS) 联合发布的全球地磁场模型，")
    lines.append("    /// 用于导航、定向和其他需要地磁场信息的应用。WMM 模型是一个球谐系数模型，")
    lines.append("    /// 每五年更新一次，提供地磁场的当前状态和未来五年的预测。")
    lines.append("    ///")
    lines.append("    /// This model is a global magnetic field model jointly published by the National Centers for")
    lines.append("    /// Environmental Information (NCEI) and the British Geological Survey (BGS). It is used for")
    lines.append("    /// navigation, orientation, and other applications requiring magnetic field information.")
    lines.append("    /// The WMM model is a spherical harmonic coefficient model that is updated every five years,")
    lines.append("    /// providing the current state of the magnetic field and a five-year prediction.")
    lines.append("    ///")
    lines.append(f"    /// 模型文件: {doc.file_name}")
    lines.append(f"    /// Model file: {doc.file_name}")
    lines.append("    ///")
    lines.append(f"    /// 有效 epoch: {epoch_str} - {epoch_next}")
    lines.append(f"    /// Valid epochs: {epoch_str} - {epoch_next}")
    lines.append(f"    static let {model_name} = SHCModel(")
    lines.append(f"        fileName: \"{_swift_string(doc.file_name)}\",")
    lines.append("        headers: [")
    lines.append(f"            \"{_swift_string(doc.header)}\",")
    lines.append("        ],")
    lines.append("        headerNumbers: [],")
    lines.append(
        "        epochs: " + _format_double_array([epoch_str, epoch_next], "        ") + ","
    )
    lines.append("        coefficients: [")
    for row in doc.coefficients:
        lines.append("            Coefficient(")
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


def _clean_output() -> None:
    if not OUT_DIR.exists():
        return
    for path in OUT_DIR.glob("SHCModel+wmm*.swift"):
        path.unlink()


def _extract_cof(bytes_data: bytes, url: str) -> tuple[str, str]:
    if url.lower().endswith(".zip"):
        with zipfile.ZipFile(BytesIO(bytes_data)) as zf:
            names = [name for name in zf.namelist() if name.lower().endswith(".cof")]
            if not names:
                raise ValueError(f"No .COF file in {url}")
            names.sort()
            target = names[0]
            with zf.open(target) as fp:
                return Path(target).name, fp.read().decode("utf-8", errors="replace")
    return Path(url).name, bytes_data.decode("utf-8", errors="replace")


def _candidate_urls(version: int) -> list[str]:
    if version == 2025:
        return [
            "https://www.ncei.noaa.gov/sites/default/files/2024-12/WMM2025COF.zip",
            "https://www.ngdc.noaa.gov/geomag/WMM/data/WMM2025/WMM2025LegacyC.zip",
            "https://www.ngdc.noaa.gov/geomag/WMM/data/WMM2025/WMM2025COF.zip",
        ]
    return [
        f"https://www.ngdc.noaa.gov/geomag/WMM/data/WMM{version}/WMM{version}LegacyC.zip",
        f"https://www.ngdc.noaa.gov/geomag/WMM/data/WMM{version}/WMM{version}COF.zip",
    ]


def _download_doc(version: int) -> WMMDoc | None:
    for url in _candidate_urls(version):
        try:
            data = _http_bytes(url)
        except urllib.error.HTTPError:
            continue
        except urllib.error.URLError:
            continue
        file_name, text = _extract_cof(data, url)
        try:
            return _parse_wmm_cof(text, file_name)
        except ValueError:
            continue
    return None


def _ask_yes_no(prompt: str, default: str = "y") -> bool:
    suffix = " [Y/n]: " if default.lower() == "y" else " [y/N]: "
    answer = input(prompt + suffix).strip().lower()
    if not answer:
        answer = default.lower()
    return answer in ("y", "yes")


def _ask_int(prompt: str, default: int) -> int:
    answer = input(f"{prompt} [{default}]: ").strip()
    if not answer:
        return default
    return int(answer)


def main() -> None:
    _init_ssl_context()
    global URL_CONTEXT

    print("WMM data fetch (NCEI)")
    if _ask_yes_no("Use insecure TLS (only if your cert store fails)?", default="n"):
        URL_CONTEXT = ssl._create_unverified_context()

    start_version = _ask_int("Start searching from version", 2025)
    end_version = _ask_int("End searching at version", 2010)

    versions = list(range(start_version, end_version - 1, -5))
    print("Downloading available WMM models...")

    docs: list[tuple[int, WMMDoc]] = []
    for version in versions:
        doc = _download_doc(version)
        if not doc:
            print(f"Skipping WMM{version}: no downloadable COF found")
            continue
        docs.append((version, doc))

    if not docs:
        raise SystemExit("No WMM models found in the requested range.")

    OUT_DIR.mkdir(parents=True, exist_ok=True)
    _clean_output()
    for version, doc in docs:
        _write_model_file(doc, version)

    print(f"Wrote {len(docs)} WMM model files to {OUT_DIR}")


if __name__ == "__main__":
    main()
