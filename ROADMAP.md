# Roadmap del harness

> Este roadmap es **del kit**, no de los proyectos que lo usan.
> Cada proyecto tiene su propio `docs/harness/templates/ROADMAP.md`.

## v1.4 — Validación en un proyecto real

- [ ] Probar el harness de punta a punta en un proyecto nuevo (G0 → G6).
- [ ] Escribir la primera skill real: `scaffold-web-app`, y validarla en limpio.
- [ ] Medir: correcciones por gate, tokens por slice y tiempo hasta el primer deploy.
- [ ] Ajustar el banco de preguntas según la fricción observada.
- [ ] Documentar un caso de estudio con decisiones y supuestos reales.

## v1.5 — Automatización

- [ ] Instalador multiplataforma (PowerShell + bash).
- [ ] Script `check-gate` que valide el checklist pre-código.
- [ ] Plantilla de ADR y de threat model.
- [ ] Ejemplo completo de `SPEC`, `DATA-MODEL` y `DESIGN-SYSTEM` para un dominio real.
- [ ] Verificación automática de enlaces y estructura del repo.

## v2.0 — Ecosistema

- [ ] Skills por stack: Next.js, Supabase, Stripe, testing.
- [ ] Variante para equipos: roles, revisión y CI.
- [ ] Traducción al inglés.
- [ ] Sitio de documentación o landing.
- [ ] Paquete instalable (`npx create-web-harness`).

## Ideas sin prioridad

- Integración con Stitch o Figma para generar `DESIGN-SYSTEM.md`.
- Generador de `AGENTS.md` específico por stack.
- Panel de métricas de coste por fase.
- Modo "auditoría" para proyectos existentes.

## Cómo contribuir

1. Elegí un ítem y abrí un issue con la etiqueta `roadmap`.
2. Proponé alcance y criterio de aceptación antes del PR.
3. Un PR por ítem; sin cambios de protocolo mezclados con features.
