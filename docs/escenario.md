# Escenario de laboratorio - Trivy Supply Chain Lab

## Descripción

Este entorno simula una cadena de suministro de software vulnerable basada en GitHub Actions.

El objetivo es representar un escenario donde un atacante intenta aprovechar configuraciones inseguras de CI/CD para ejecutar código no confiable, detectar presencia de secretos y manipular artefactos de distribución.

## Componentes

- Laptop con Visual Studio Code: creación del entorno vulnerable.
- GitHub: repositorio de código fuente.
- GitHub Actions: entorno CI/CD vulnerable.
- Kali Linux: estación de auditoría y Red Team para fases posteriores.
- Secrets falsos: credenciales simuladas sin valor real.
- Artefactos: archivos generados para simular binarios o paquetes.
- Cosign: herramienta que se usará en fases posteriores para firmar y verificar artefactos.

## Vulnerabilidades intencionales

1. Uso de `pull_request_target` en Pull Requests.
2. Checkout del código enviado por un Pull Request.
3. Uso de un secret simulado dentro del workflow.
4. Permiso `contents: write` en workflow de release.
5. Artefactos generados sin firma criptográfica.

## Restricciones éticas

- No se usan tokens reales.
- No se atacan repositorios externos.
- No se publican paquetes en Docker Hub, npm ni PyPI.
- Todo se ejecuta en un repositorio propio de laboratorio.