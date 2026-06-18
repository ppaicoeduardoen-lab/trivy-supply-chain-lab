#!/bin/bash
set -e

VERSION="${1:-v1.0.0}"
ARTIFACT="trivy-lab-${VERSION}.txt"

mkdir -p dist

echo "=== Trivy Lab Artifact ===" > "dist/${ARTIFACT}"
echo "Version: ${VERSION}" >> "dist/${ARTIFACT}"
echo "Build date: $(date)" >> "dist/${ARTIFACT}"
echo "Commit: simulated-zombie" >> "dist/${ARTIFACT}"
echo "Status: ZOMBIE_ARTIFACT_SIMULATION" >> "dist/${ARTIFACT}"
echo "Note: archivo alterado solo para laboratorio, no malware real" >> "dist/${ARTIFACT}"

sha256sum "dist/${ARTIFACT}" > "dist/${ARTIFACT}.sha256"

echo "[WARN] Artefacto zombie simulado creado: dist/${ARTIFACT}"