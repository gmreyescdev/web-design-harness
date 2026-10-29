# EMPIEZA AQUÍ

> **Si es tu primera vez, leé solo esta página.** Son 3 pasos.

---

## Paso 1 — Instalar

Abrí PowerShell y pegá esta línea:

```powershell
irm https://raw.githubusercontent.com/gmreyescdev/web-design-harness/main/install.ps1 | iex
```

Te va a preguntar la carpeta de tu proyecto. Si no existe, la crea.
El instalador copia el harness y deja todo listo.

> Si preferís revisar el script antes de ejecutarlo: cloná el repo y corré `.\install.ps1`.

**macOS / Linux:**

```bash
git clone https://github.com/gmreyescdev/web-design-harness.git
cd web-design-harness
bash install.sh /ruta/a/tu-proyecto
```

---

## Paso 2 — Abrir OpenCode en la carpeta del proyecto

En la carpeta **del proyecto**, no en la del kit. Eso es todo: el agente ya tiene
`AGENTS.md` y `docs/harness/` para leer.

---

## Paso 3 — Pegar este mensaje

```text
Inicia el Web Design Harness en modo Express. Hazme la Ronda 1.
```

El agente lee las reglas, te hace 5 preguntas y escribe el primer `SPEC.md`.

---

## Qué va a pasar

| Ronda | Tema | Resultado |
|---|---|---|
| 1 | Producto y usuarios | `SPEC.md` inicial |
| 2 | Alcance | MVP y no-alcance |
| 3 | Datos y permisos | `DATA-MODEL.md` |
| 4 | Diseño | `DESIGN-SYSTEM.md` |
| 5 | Técnica y riesgos | `ARCHITECTURE.md` |
| Gate | Revisión | Recién ahí se escribe código |

No necesitás saber de stacks, bases de datos ni diseño para empezar.
El agente te guía y, si no sabés algo, respondés **"no sé"**.

---

## Si algo falla

| Problema | Solución |
|---|---|
| `irm` no funciona | Cloná el repo y ejecutá `.\install.ps1` |
| No aparece `AGENTS.md` | Abrí OpenCode en la carpeta del proyecto, no en la del kit |
| El agente empieza a escribir código | Recordale: "No escribas código hasta el gate pre-código" |
| No sabés una respuesta | Respondé "no sé" y el agente propone un default |
| Querés empezar de nuevo | Borrá `docs/harness/state/PROJECT-STATE.md` y volvé al Paso 3 |

---

## Instalación manual (avanzado)

```powershell
git clone https://github.com/gmreyescdev/web-design-harness.git C:\ruta\al\kit
C:\ruta\al\kit\install.ps1 -Project C:\ruta\a\tu-proyecto
```

Parámetros:

- `-Project <ruta>`: carpeta destino. Si no existe, la crea.
- `-Force`: sobrescribe `AGENTS.md` sin preguntar.

---

## Estado del kit

| Campo | Valor |
|---|---|
| Versión | 1.4 |
| Gates | 6 (G0–G5 + construcción) |
| Rondas | 6 |
| Instalación | `install.ps1` / `install.sh` |
| Subagentes | solo G6 (`SUBAGENTS.md`) |
| Coste | reglas en `COST.md` |
| Skills | política en `SKILLS.md` |
| Proyecto asociado | ninguno |

---

## Regla de oro

Cada decisión termina en un archivo, no en el chat.
Si no está en `PROJECT-STATE.md` o en un artefacto, no existe.
