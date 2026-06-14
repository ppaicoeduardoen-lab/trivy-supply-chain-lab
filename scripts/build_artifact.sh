#!/bin/bash

set -e

mkdir -p releases

ARTIFACT_NAME="trivy-demo-v1.txt"

echo "=== Artefacto legítimo del laboratorio ===" > releases/$ARTIFACT_NAME
echo "Proyecto: Trivy Supply Chain Lab" >> releases/$ARTIFACT_NAME
echo "Fecha: $(date)" >> releases/$ARTIFACT_NAME
echo "Commit: $(git rev-parse --short HEAD)" >> releases/$ARTIFACT_NAME

echo "[OK] Artefacto generado en releases/$ARTIFACT_NAME"