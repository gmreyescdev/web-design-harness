# KICKOFF.md — Prompts listos para copiar

Pega el bloque que corresponda en la sesión del agente, dentro de la carpeta del proyecto.

---

## 1. Arranque (primera vez)

```text
Vamos a diseñar un sistema web desde cero con el Web Design Harness.

Reglas:
- Lee AGENTS.md y HARNESS.md antes de responder.
- Modo: [EXPRESS / COMPLETO].
- No escribas código de producto hasta pasar el gate pre-código.
- Una ronda de preguntas por mensaje, máximo 5, con default recomendado.
- Cada respuesta mía termina en un archivo, no en el chat.

Paso 1: lee el estado en docs/harness/state/PROJECT-STATE.md (si no existe, créalo desde la plantilla).
Paso 2: hazme la Ronda 1 (Producto y usuarios) según QUESTION-BANK.md.
Paso 3: espera mis respuestas. No avances a la Ronda 2 todavía.
```

---

## 2. Modo Express

```text
Modo Express: usa los defaults de QUESTION-BANK.md para todo lo reversible.
Solo pregúntame lo irreversible: producto, alcance, entidad central, roles, auth y deploy.
Agrupa en 3 mensajes: (1) producto y alcance, (2) datos y permisos, (3) técnico y deploy.
Después escribe los 6 artefactos y muéstrame un resumen para aprobar.
```

---

## 3. Retomar sesión

```text
Retomamos. Lee docs/harness/state/PROJECT-STATE.md y los artefactos que indique.
Dime en 3 líneas: gate actual, qué falta y qué propones.
No escribas nada más hasta que confirme.
```

---

## 4. Avanzar de ronda

```text
Cierra la ronda actual:
1. Actualiza el artefacto correspondiente.
2. Actualiza PROJECT-STATE.md (decisiones, supuestos, preguntas abiertas).
3. Muéstrame un resumen de 5–8 bullets y pide mi OK.
No empieces la ronda siguiente hasta que apruebe.
```

---

## 5. Cerrar un gate

```text
Evalúa el gate [G0..G4] contra su criterio de salida en HARNESS.md.
Lista qué está completo, qué falta y qué supuestos siguen abiertos.
Si falta algo, hazme solo las preguntas necesarias para cerrarlo.
Si está completo, marca el artefacto como APROBADO y actualiza el estado.
```

---

## 6. Pasar a construcción

```text
Revisa checklists/GATE-PRE-CODE.md. Si hay ítems sin marcar, no construyas: dime cuáles son.
Si está completo, propón el primer slice vertical del ROADMAP con:
- alcance exacto
- criterios de aceptación
- archivos que tocarás
- comandos de verificación
Espera mi OK antes de editar.
```

---

## 7. Construir un slice

```text
Implementa el slice [N]: [nombre].
Contexto: lee [archivos de referencia] y sigue su patrón.
Criterios: [lista verificable].
Restricciones: no toques [X], no instales dependencias, no cambies el modelo de datos.
Al terminar: corre typecheck, lint, build y tests; muestra git diff --stat y un resumen de 5 bullets.
Actualiza PROJECT-STATE.md.
```

---

## 8. Corrección de rumbo

```text
Antes de seguir, hazme 5 preguntas sobre lo que estás asumiendo y no está en el spec.
Marca cada supuesto con [SUPUESTO] y espera mi respuesta.
No escribas código hasta resolverlo.
```

---

## 9. Revisión de una entrega

```text
Revisa tu propia entrega contra AGENTS.md y DOD-SLICE.md.
Para cada ítem di: cumple / no cumple / no aplica, con evidencia (comando o archivo).
No corrijas todavía: primero muéstrame el resultado.
```

---

## 10. Cambio de alcance

```text
Quiero agregar/cambiar: [descripción].
Evalúa impacto en SPEC, DATA-MODEL, DESIGN-SYSTEM, ARCHITECTURE y ROADMAP.
Propón: aceptar, posponer o rechazar, con costo estimado.
Registra la decisión como scope change si acepto. No implementes hasta mi OK.
```

---

## 11. Delegar un slice a un subagente

```text
Lanza un subagente para el slice [N] según SUBAGENTS.md.
Brief obligatorio: rol, objetivo, contexto (rutas), alcance (qué puede y qué no tocar),
criterios de aceptación, restricciones, comandos de verificación y formato de salida.
Antes de lanzarlo, muéstrame la tabla de propiedad de archivos y espera mi OK.
Al volver: revisa el diff, corre la verificación completa y resúmeme el resultado.
```

---

## 12. Revisión adversarial

```text
Lanza un subagente revisor distinto del implementador.
Entrégale AGENTS.md, ACCEPTANCE.md, el diff y los criterios del slice.
Debe reportar: cumple / no cumple / no verificable, con evidencia (archivo o comando).
No debe corregir: solo reportar. Yo decido qué se arregla.
```

---

## 13. Trabajo con presupuesto

```text
Aplica COST.md en esta sesión:
- lee solo los archivos necesarios y en rangos
- acota las salidas de comandos
- responde en bullets + git diff --stat
- no edites AGENTS.md ni el spec
Al terminar, dime cuántos archivos leíste y qué lecturas podrías haber evitado.
```

---

## 14. Usar una skill

```text
Antes de implementar, revisa si alguna skill de docs/harness/SKILLS.md aplica a esta tarea.
Si aplica: cárgala, sigue sus pasos y su verificación, y avísame cuál usaste.
Si no aplica: dilo y continúa sin cargarla.
Si la skill contradice el spec, detente y pregúntame.
```
