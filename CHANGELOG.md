# Changelog

Formato basado en [Keep a Changelog](https://keepachangelog.com/es/1.1.0/).
Versionado semántico.

## [1.4] — 2026-10-29

### Añadido

- `install.ps1`: instalador de un comando para Windows, con descarga automática del kit.
- `install.sh`: instalador para macOS y Linux.
- Instalación en 3 pasos en `EMPIEZA-AQUI.md` y `README.md`.
- Guía de problemas frecuentes para quien empieza desde cero.

### Cambiado

- El onboarding ya no requiere copiar archivos a mano.
- El mensaje de arranque se redujo a una línea.

## [1.3] — 2026-10-29

### Añadido

- `SKILLS.md`: política de skills, ciclo de vida, registro, instalación y prueba.
- `skills/_TEMPLATE/SKILL.md`: plantilla compatible con OpenCode.
- `skills/README.md`: instalación en `.opencode/skills/`.
- `COST.md`: economía de tokens (caché/input/output) y presupuesto por fase.
- `SUBAGENTS.md`: delegación, brief obligatorio, propiedad de archivos y revisión.
- `LICENSE` (MIT) y `.gitignore`.
- Prompts 11–14 en `KICKOFF.md` (delegar, revisión adversarial, presupuesto, skills).
- `EMPIEZA-AQUI.md` con instalación completa en PowerShell.

### Cambiado

- `AGENTS.md`: reglas de subagentes, economía de tokens y skills.
- `HARNESS.md`: secciones 10 (subagentes), 11 (coste) y 12 (skills).
- `MODEL-NOTES.md`: secciones 10 (coste) y 11 (skills).
- `README.md`: estructura, principios, instalación y contribución.
- Rutas personales reemplazadas por placeholders para uso público.

## [1.2] — 2026-10-29

### Añadido

- `COST.md` con la aritmética de tokens y reglas de recorte.
- Presupuesto por fase y checklist por turno.
- Prompt de trabajo con presupuesto en `KICKOFF.md`.

## [1.1] — 2026-10-29

### Añadido

- `SUBAGENTS.md` con matriz por fase, contrato de brief y anti-patrones.
- Reglas de delegación en `AGENTS.md`, `HARNESS.md` y `MODEL-NOTES.md`.
- Prompts de delegación y revisión adversarial en `KICKOFF.md`.

## [1.0] — 2026-10-29

### Añadido

- Protocolo de 6 gates y banco de 6 rondas de preguntas.
- Plantillas de SPEC, DATA-MODEL, DESIGN-SYSTEM, ARCHITECTURE, ACCEPTANCE y ROADMAP.
- `PROJECT-STATE.md`, gate pre-código y Definition of Done por slice.
- Prompts de arranque, retomada y cambio de alcance.
