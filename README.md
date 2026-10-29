# Web Design Harness

Kit de diseño para arrancar **sistemas web desde cero** con un agente LLM.
Calibrado para modelos rápidos (DeepSeek Flash): contexto explícito, preguntas con default,
artefactos persistidos en archivos y verificación por comandos.

**Contrato central:** no se escribe código de producto hasta que existan y estén aprobados
`SPEC.md`, `DATA-MODEL.md`, `DESIGN-SYSTEM.md`, `ARCHITECTURE.md`, `ACCEPTANCE.md` y `ROADMAP.md`.

---

## Estructura

| Archivo | Función |
|---|---|
| `AGENTS.md` | Reglas que el agente debe cumplir en el proyecto (copiar a la raíz del repo). |
| `HARNESS.md` | Protocolo: fases, gates, mecánica de preguntas, control de cambios. |
| `MODEL-NOTES.md` | Ajustes específicos para modelos rápidos: cómo pedir, verificar y no alucinar. |
| `SUBAGENTS.md` | Cuándo delegar, contrato de brief, propiedad de archivos y revisión. |
| `COST.md` | Economía de tokens: caché, recortes y presupuesto por fase. |
| `SKILLS.md` | Política de skills: cuándo crearlas, registro, ciclo de vida y prueba. |
| `KICKOFF.md` | Prompts listos para copiar y arrancar / retomar / cambiar de fase. |
| `QUESTION-BANK.md` | 6 rondas de preguntas con defaults recomendados. |
| `CHANGELOG.md` | Historial de versiones del harness. |
| `ROADMAP.md` | Próximas versiones del kit y cómo contribuir. |
| `templates/` | Artefactos a completar (SPEC, datos, diseño, arquitectura, aceptación, roadmap). |
| `skills/` | Plantilla y skills reutilizables (OpenCode: `.opencode/skills/`). |
| `state/PROJECT-STATE.md` | Tablero vivo: fase, decisiones, supuestos, pendientes, próximo paso. |
| `checklists/` | Gate pre-código y Definition of Done por slice. |

---

## Flujo en 6 gates

```
G0 Intake ──► G1 Alcance ──► G2 Datos ──► G3 Diseño ──► G4 Técnico ──► G5 Pre-código ──► G6 Construcción
   SPEC        SPEC v1        DATA-MODEL    DESIGN-SYSTEM   ARCHITECTURE    checklist        slices + DoD
                             ROADMAP v0                    ACCEPTANCE
                                                           ROADMAP v1
```

Cada gate termina con un artefacto escrito y un **OK explícito** del humano.
Si el humano pide código antes de G5, se ofrece un *spike* descartable en `spikes/`
y se registra como deuda de diseño.

---

## Uso rápido

1. Copia `AGENTS.md` a la raíz del proyecto nuevo.
2. Copia `templates/`, `state/` y `checklists/` a `docs/harness/` del proyecto.
3. Abre la sesión del agente en el proyecto y pega el prompt **Arranque** de `KICKOFF.md`.
4. Responde **una ronda por mensaje**. El agente escribe el artefacto y te muestra un resumen.
5. Da OK o corrige. Al llegar a G5, recién ahí se construye.

> Regla de oro: **cada respuesta termina en un archivo, no en el chat.**
> Si una decisión no está en `PROJECT-STATE.md` o en un artefacto, no existe.

---

## Instalación

```bash
git clone https://github.com/<tu-usuario>/web-design-harness.git
```

Después copiá el kit a tu proyecto: `AGENTS.md` a la raíz y el resto a `docs/harness/`.
El comando completo para PowerShell está en `EMPIEZA-AQUI.md`.

---

## Dos modos

- **Express (30–45 min):** el agente usa los defaults del banco de preguntas y solo consulta
  lo irreversible: producto, alcance, modelo de datos, auth y deploy.
- **Completo (2–3 sesiones):** las 6 rondas, decisión por decisión, con registro y validación.

Elige el modo en el primer mensaje. Se puede empezar Express y profundizar después.

---

## Principios

1. **Preguntar antes de asumir.** Toda ambigüedad se convierte en pregunta o en supuesto registrado.
2. **Un artefacto por gate.** Nada de diseño en la cabeza del agente.
3. **Decisiones con fecha y motivo.** Nunca se borran: se superseden.
4. **Criterios verificables.** Si no se puede comprobar con un comando o una acción, no es criterio.
5. **Slices verticales.** Una feature completa de punta a punta antes de la siguiente.
6. **Verificación real.** Build, typecheck y tests ejecutados; nunca reportados de memoria.
7. **Subagentes solo en construcción.** Paralelizan lo especificado; no deciden arquitectura,
   datos, auth ni gates (ver `SUBAGENTS.md`).
8. **Contexto dirigido.** Leer solo lo necesario y acotar salidas; el input nuevo cuesta
   50× el caché (ver `COST.md`).

---

## Contribuir

- Fork + branch + pull request.
- Una skill nueva debe seguir `SKILLS.md` y estar probada en un proyecto limpio.
- No incluir datos personales, rutas absolutas ni secretos.
- Los cambios de protocolo se discuten en un issue antes del PR.
- El roadmap del kit está en `ROADMAP.md`.

## Licencia

MIT. Ver `LICENSE`.
