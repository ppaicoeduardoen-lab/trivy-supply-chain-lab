# Trivy Supply Chain Lab

Laboratorio académico basado en un escenario de cadena de suministro tipo Trivy.

## Objetivo

Simular un entorno vulnerable de CI/CD para demostrar:

- Workflow Injection.
- Uso inseguro de `pull_request_target`.
- Secrets falsos en GitHub Actions.
- Permisos excesivos del `GITHUB_TOKEN`.
- Registry vulnerable.
- Artefactos sin firma.
- Consumo inseguro desde un cliente tipo LiteLLM.
- Mitigación con Cosign, OIDC y mínimo privilegio.

## Herramientas

- Kali Linux
- Nmap
- Nessus
- Acunetix
- Shodan
- GitHub Actions
- Docker
- Cosign
- Trivy

## Restricciones éticas

No se usan tokens reales, no se ataca infraestructura externa y no se publica malware.