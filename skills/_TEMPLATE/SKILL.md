---
name: nombre-de-la-skill
description: Qué hace en una frase. Usar cuando [trigger exacto]. No usar cuando [exclusión].
---

# [Nombre de la skill]

## Objetivo

[Una frase: qué resultado produce.]

## Precondiciones

- [ ] [Artefacto o decisión que debe existir]
- [ ] [Archivo de referencia disponible]

## Pasos

1. [Acción concreta, con ruta exacta]
2. [Acción concreta]
3. [Acción concreta]
4. [Estados: loading / error / empty, si aplica]
5. [Tests]

## Verificación

| Comando | Resultado esperado |
|---|---|
| `[comando]` | [salida esperada] |
| `[comando]` | [salida esperada] |

## Salida

- Resumen de 5 bullets
- `git diff --stat`
- Supuestos y `[VERIFICAR]`

## Stop conditions

- Si [condición], detente y pregunta.
- Si [condición], no continúes: registra el bloqueo.
- Si el spec contradice esta skill, gana el spec.

## Anti-patrones

- No [acción fuera de alcance].
- No [inventar API/endpoint/versión].
- No [saltar la verificación].

## Referencias

- `[ruta/al/archivo/de/referencia]`
- `[doc oficial]` `[VERIFICAR]`
