# skills/

Una carpeta por skill, con un `SKILL.md` dentro. El nombre de la carpeta debe coincidir
con el campo `name` del frontmatter.

```text
skills/
├── _TEMPLATE/SKILL.md     ← plantilla; NO copiar a una ruta activa
└── <nombre>/SKILL.md      ← skills reales del proyecto
```

## Instalar en un proyecto

```powershell
$kit  = 'C:\ruta\donde\clonaste\web-design-harness'
$proj = 'C:\ruta\a\tu-proyecto'

New-Item -ItemType Directory -Path "$proj\.opencode\skills" -Force | Out-Null

Get-ChildItem "$kit\skills" -Directory |
  Where-Object { $_.Name -notlike '_*' } |
  ForEach-Object {
    Copy-Item -LiteralPath $_.FullName -Destination "$proj\.opencode\skills\$($_.Name)" -Recurse -Force
  }
```

## Reglas

- `SKILL.md` en mayúsculas; `name` en minúsculas con guiones.
- `description` con trigger y exclusión.
- Sin verificación no se activa.
- Toda skill nueva se registra en `SKILLS.md` §8.
