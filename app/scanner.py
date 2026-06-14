import os
import sys
from datetime import datetime


def scan_target(target_path: str) -> None:
    print("=== Trivy Supply Chain Lab Scanner ===")
    print(f"Fecha de ejecución: {datetime.now()}")
    print(f"Objetivo analizado: {target_path}")

    if not os.path.exists(target_path):
        print("[WARN] El archivo objetivo no existe.")
        return

    with open(target_path, "r", encoding="utf-8", errors="ignore") as file:
        content = file.read()

    findings = []

    weak_patterns = [
        "password",
        "secret",
        "token",
        "api_key",
        "PRIVATE_KEY",
    ]

    for pattern in weak_patterns:
        if pattern.lower() in content.lower():
            findings.append(pattern)

    if findings:
        print("[ALERTA] Posibles datos sensibles encontrados:")
        for finding in findings:
            print(f" - Patrón detectado: {finding}")
    else:
        print("[OK] No se encontraron patrones sensibles básicos.")


if __name__ == "__main__":
    target = sys.argv[1] if len(sys.argv) > 1 else "README.md"
    scan_target(target)