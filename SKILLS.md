# SKILLS.md — Política de skills

> Una skill es un **procedimiento reutilizable** que el agente carga bajo demanda.
> No es un spec, no es un gate y no reemplaza el juicio.

---

## 1. Qué es y qué no

| Es | No es |
|---|---|
| Un procedimiento con pasos y verificación | Una decisión de arquitectura |
| Un checklist para una tarea repetible | Un documento de producto |
| Un contrato de salida | Un sustituto de `AGENTS.md` |
| Conocimiento estable de un stack o API | Contexto permanente cargado siempre |

---

## 2. Capas del harness

| Capa | Archivo | Cuándo se carga |
|---|---|---|
| Invariantes | `AGENTS.md` | Siempre |
| Proceso | `HARNESS.md` | Siempre / por sesión |
| Delegación | `SUBAGENTS.md` | Al delegar |
| Presupuesto | `COST.md` | Resumen siempre |
| Procedimientos | `skills/*/SKILL.md` | **Solo si el trigger aplica** |

La skill no reemplaza los gates: acelera **G6 (construcción)**. Si una skill empieza a
decidir producto, datos o arquitectura, está mal ubicada.

---

## 3. Cuándo crear una skill

- La misma corrección apareció **dos veces**.
- El procedimiento tiene un orden no obvio o pasos que se olvidan.
- Hay riesgo de alucinación (API, versión, comando, endpoint).
- La convención debe repetirse en muchos archivos.
- El coste del error es alto: auth, pagos, migraciones, release, RLS.

> Regla: **una skill nace de una corrección repetida, no de la imaginación.**

---

## 4. Cuándo no

- Decisiones de producto, datos o arquitectura → gates G0–G5.
- Tareas de 1–2 archivos.
- Algo ya cubierto por `AGENTS.md`.
- Procedimientos que cambian cada semana.
- Si no se puede verificar, no es una skill: es una opinión.

---

## 5. Anatomía

```markdown
---
name: nombre-de-la-skill
description: Qué hace en una frase. Usar cuando [trigger exacto]. No usar cuando [exclusión].
---

# Objetivo
# Precondiciones
# Pasos
# Verificación
# Salida
# Stop conditions
# Anti-patrones
# Referencias
```

Reglas de formato (OpenCode):

- `name` obligatorio, en minúsculas, con guiones simples, **igual al nombre de la carpeta**.
- `description` obligatorio, 1–1024 caracteres, con trigger y exclusión.
- El archivo debe llamarse `SKILL.md` (mayúsculas).
- No usar campos que OpenCode ignora (`allowed-tools` no controla herramientas en v1).

Ver `skills/_TEMPLATE/SKILL.md`.

---

## 6. Reglas de escritura para un modelo rápido

1. **Trigger quirúrgico:** "usar cuando…" y "no usar cuando…".
2. **Corta:** 1–2 páginas. Si necesita más, se parte.
3. **Imperativa:** pasos numerados, no ensayo.
4. **Ejecutable:** comandos, rutas y plantillas exactas.
5. **Decisiones con default:** "si no hay preferencia, usa X".
6. **Stop conditions:** cuándo detenerse y preguntar.
7. **Verificación obligatoria:** comando + resultado esperado.
8. **Versionado:** fecha de última validación y `[VERIFICAR]` donde aplique.
9. **Proyecto-agnóstica:** los valores concretos van en `AGENTS.md`.
10. **Probada en limpio:** si necesitó más de 2 correcciones, se reescribe.

---

## 7. Ciclo de vida

```text
propuesta ──► borrador ──► probada ──► activa ──► deprecada
```

| Estado | Criterio |
|---|---|
| propuesta | Hay una necesidad repetida identificada |
| borrador | Existe el `SKILL.md`, sin probar |
| probada | 1 corrida en proyecto limpio con verificación en verde |
| activa | 2 corridas limpias sin correcciones adicionales |
| deprecada | Stack/versión cambió o ya no se usa |

Revisión: cada **90 días** o ante un cambio de versión del stack.

---

## 8. Registro

| Skill | Trigger | Fase | Estado | Dueño | Última validación |
|---|---|---|---|---|---|
| `scaffold-web-app` | Inicializar un proyecto con el stack base | G6 · slice 1 | propuesta | — | — |
| `design-system-impl` | Implementar tokens y componentes base | G6 | propuesta | — | — |
| `data-layer` | Consultas, mutaciones y cache | G6 | propuesta | — | — |
| `auth-flow` | Login, sesión, guards y RLS | G6 | propuesta | — | — |
| `crud-feature` | Entidad nueva de punta a punta | G6 | propuesta | — | — |
| `testing-slice` | Cerrar un slice con tests | G6 | propuesta | — | — |
| `deploy-preview` | CI, entornos y primer deploy | G6 | propuesta | — | — |

> Las skills se crean cuando el proyecto las necesita, no todas por adelantado.
> Este registro se actualiza al crear, probar o deprecar una skill.

---

## 9. Instalación en OpenCode

Rutas que OpenCode descubre:

```text
<proyecto>/.opencode/skills/<name>/SKILL.md     ← recomendada
<proyecto>/.agents/skills/<name>/SKILL.md       ← compatible
~/.config/opencode/skills/<name>/SKILL.md       ← global
```

- Una carpeta por skill; el nombre de la carpeta debe coincidir con `name`.
- No copiar `_TEMPLATE` a una ruta activa.
- Las skills del proyecto se versionan con el proyecto.
- Si una skill no aparece: verificar `SKILL.md`, frontmatter y nombre único.

---

## 10. Cómo probar una skill

1. Proyecto limpio y misma tarea con y sin skill.
2. Medir: correcciones necesarias, tiempo, tokens, defectos.
3. Criterio de aprobación: **≤ 1 corrección** y verificación en verde.
4. Si falla, ajustar el trigger o los pasos; no agregar prosa.

| Métrica | Sin skill | Con skill |
|---|---|---|
| Correcciones | | |
| Tiempo hasta primer resultado | | |
| Tokens del slice | | |
| Defectos en revisión | | |

---

## 11. Anti-patrones

| Anti-patrón | Por qué falla | Corrección |
|---|---|---|
| Skill de 10 páginas | Diluye la atención | Partir en skills chicas |
| Trigger vago | Se activa de más | "No usar cuando…" |
| Duplicar `AGENTS.md` | Compite con las invariantes | Referenciar, no repetir |
| Skill que decide arquitectura | Rompe los gates | Mover a G0–G5 |
| Skill sin verificación | No se puede confiar | Agregar comandos y salida |
| Skill sin dueño | Se vuelve obsoleta | Registro con dueño y fecha |

---

## 12. Checklist para activar una skill

- [ ] Trigger y exclusión explícitos
- [ ] Nombre coincide con la carpeta
- [ ] Pasos ejecutables y en orden
- [ ] Verificación con comando y resultado esperado
- [ ] Stop conditions definidas
- [ ] Probada en proyecto limpio (≤ 1 corrección)
- [ ] Registrada en la tabla de §8
- [ ] Dueño y fecha de validación asignados
