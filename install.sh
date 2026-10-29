#!/usr/bin/env bash
set -euo pipefail

KIT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT="${1:-}"

if [ -z "$PROJECT" ]; then
  read -r -p "Carpeta de tu proyecto (Enter para ./mi-proyecto): " PROJECT
  PROJECT="${PROJECT:-./mi-proyecto}"
fi

mkdir -p "$PROJECT/docs/harness"
cp "$KIT/AGENTS.md" "$PROJECT/AGENTS.md"

for file in README.md HARNESS.md MODEL-NOTES.md SUBAGENTS.md COST.md SKILLS.md KICKOFF.md QUESTION-BANK.md; do
  cp "$KIT/$file" "$PROJECT/docs/harness/$file"
done

for dir in templates state checklists; do
  cp -R "$KIT/$dir" "$PROJECT/docs/harness/"
done

if [ -d "$KIT/skills" ]; then
  mkdir -p "$PROJECT/.opencode/skills"
  for skill in "$KIT"/skills/*/; do
    name="$(basename "$skill")"
    case "$name" in _*) continue ;; esac
    cp -R "$skill" "$PROJECT/.opencode/skills/$name"
  done
fi

if [ ! -d "$PROJECT/.git" ] && command -v git >/dev/null 2>&1; then
  (cd "$PROJECT" && git init -b main >/dev/null)
fi

echo ""
echo "Listo. Harness instalado en: $PROJECT"
echo ""
echo "Ahora:"
echo "  1. Abre OpenCode en esa carpeta."
echo "  2. Pega: Inicia el Web Design Harness en modo Express. Hazme la Ronda 1."
echo "  3. Responde las 5 preguntas."
echo ""
echo "No se escribe codigo hasta que apruebes el diseno."
echo ""
