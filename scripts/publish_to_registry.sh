#!/bin/bash
set -e

VERSION="${1:-v1.0.0}"
ARTIFACT="trivy-lab-${VERSION}.txt"

mkdir -p registry/docker registry/npm registry/pypi

cp "dist/${ARTIFACT}" registry/docker/
cp "dist/${ARTIFACT}" registry/npm/
cp "dist/${ARTIFACT}" registry/pypi/

echo "[OK] Artefacto publicado en registry simulado docker/npm/pypi"