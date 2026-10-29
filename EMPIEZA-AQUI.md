# EMPIEZA AQUÍ

Este workspace contiene **solo el harness**: un kit de diseño reutilizable.
**No hay proyecto creado ni código.** Es la plantilla que se copia a cada proyecto nuevo.

---

## Contenido

```
Harness DeepSeek v4.q flash 1017/
├── AGENTS.md              ← reglas del agente (se copia a la raíz del proyecto)
├── HARNESS.md             ← protocolo: 6 gates y mecánica de preguntas
├── MODEL-NOTES.md         ← calibración para modelos rápidos
├── SUBAGENTS.md           ← cuándo delegar, brief, ownership y revisión
├── COST.md                ← economía de tokens: caché, recortes, presupuesto
├── SKILLS.md              ← política de skills: registro, ciclo de vida, prueba
├── QUESTION-BANK.md       ← 6 rondas, ~33 preguntas con defaults
├── KICKOFF.md             ← 10 prompts listos para copiar
├── README.md              ← visión general del kit
├── templates/             ← SPEC, DATA-MODEL, DESIGN-SYSTEM, ARCHITECTURE, ACCEPTANCE, ROADMAP
├── skills/                ← plantilla y skills (OpenCode: .opencode/skills/)
├── state/                 ← PROJECT-STATE (tablero vivo)
├── checklists/            ← GATE-PRE-CODE y DOD-SLICE
└── EMPIEZA-AQUI.md        ← este archivo
```

---

## Cómo usarlo en un proyecto nuevo

1. Creá o abrí la carpeta del proyecto.
2. Copiá `AGENTS.md` a la **raíz** del proyecto.
3. Copiá el resto a `<proyecto>/docs/harness/`.
4. Abrí la sesión del agente en la raíz del proyecto.
5. Pegá el prompt **1. Arranque** de `docs/harness/KICKOFF.md`.
6. Respondé la Ronda 1. No se escribe código hasta el gate G5.

### Instalación en un comando (PowerShell)

```powershell
$kit  = 'C:\ruta\donde\clonaste\web-design-harness'
$proj = 'C:\ruta\a\tu-proyecto'

New-Item -ItemType Directory -Path "$proj\docs\harness" -Force | Out-Null
Copy-Item -LiteralPath "$kit\AGENTS.md" -Destination "$proj\AGENTS.md" -Force

'README.md','HARNESS.md','MODEL-NOTES.md','SUBAGENTS.md','COST.md','SKILLS.md','KICKOFF.md','QUESTION-BANK.md' |
  ForEach-Object { Copy-Item -LiteralPath "$kit\$_" -Destination "$proj\docs\harness\" -Force }

Copy-Item -LiteralPath "$kit\templates" -Destination "$proj\docs\harness\templates" -Recurse -Force
Copy-Item -LiteralPath "$kit\state"     -Destination "$proj\docs\harness\state"     -Recurse -Force
Copy-Item -LiteralPath "$kit\checklists" -Destination "$proj\docs\harness\checklists" -Recurse -Force

# Skills (opcional): solo las reales, nunca la plantilla
New-Item -ItemType Directory -Path "$proj\.opencode\skills" -Force | Out-Null
Get-ChildItem "$kit\skills" -Directory |
  Where-Object { $_.Name -notlike '_*' } |
  ForEach-Object {
    Copy-Item -LiteralPath $_.FullName -Destination "$proj\.opencode\skills\$($_.Name)" -Recurse -Force
  }
```

---

## Flujo

```
G0 Producto → G1 Alcance → G2 Datos → G3 Diseño → G4 Técnico → G5 Gate → G6 Construcción
```

Cada gate cierra con un artefacto escrito y un OK explícito. Los detalles están en `HARNESS.md`.

---

## Estado del kit

| Campo | Valor |
|---|---|
| Versión | 1.3 |
| Gates | 6 (G0–G5 + construcción) |
| Rondas | 6 |
| Subagentes | solo G6 (`SUBAGENTS.md`) |
| Coste | reglas en `COST.md` |
| Skills | política en `SKILLS.md`; plantilla en `skills/_TEMPLATE/` |
| Proyecto asociado | ninguno |
| Listo para copiar | sí |

---

## Regla de oro

Cada decisión termina en un archivo, no en el chat.
Si no está en `PROJECT-STATE.md` o en un artefacto, no existe.
