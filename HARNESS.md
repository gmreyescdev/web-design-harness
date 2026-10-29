# HARNESS.md — Protocolo de diseño

Este documento define **cómo** se avanza. `AGENTS.md` define las reglas; este define el proceso.
El objetivo es convertir una idea vaga en un sistema construible sin que el agente invente nada.

---

## 1. Gates

| Gate | Ronda | Pregunta que responde | Artefacto | Criterio de salida |
|---|---|---|---|---|
| **G0 Intake** | R1 | ¿Qué es, para quién y para qué? | `SPEC.md` v0 | Problema, usuarios, acción central y éxito definidos |
| **G1 Alcance** | R2 | ¿Qué entra y qué no? | `SPEC.md` v1 + `ROADMAP.md` v0 | MVP de 3–5 features y no-alcance explícito |
| **G2 Datos** | R3 | ¿Qué se guarda y quién puede qué? | `DATA-MODEL.md` | Entidades, relaciones, roles y datos sensibles |
| **G3 Diseño** | R4 | ¿Cómo se ve y se siente? | `DESIGN-SYSTEM.md` | Tokens, componentes base y patrones de layout |
| **G4 Técnico** | R5 + R6 | ¿Con qué se construye y qué puede fallar? | `ARCHITECTURE.md` + `ACCEPTANCE.md` + `ROADMAP.md` v1 | Stack, auth, deploy, riesgos y criterios |
| **G5 Pre-código** | — | ¿Estamos listos? | `GATE-PRE-CODE.md` | Checklist completo + OK humano |
| **G6 Construcción** | — | ¿Funciona? | Slices + `DOD-SLICE.md` | Cada slice verificado |

**Regla:** un gate no se cierra por cansancio ni por presión de tiempo. Se cierra por criterio cumplido
o por decisión explícita del humano registrada como riesgo aceptado.

---

## 2. Mecánica de una ronda

1. **Anunciar:** "Ronda N — [tema]. Voy a hacer X preguntas; si algo no lo sabes, responde 'no sé'
   y propongo un default."
2. **Preguntar:** máximo 5 preguntas, numeradas, con default entre paréntesis.
3. **Esperar:** no escribir el artefacto hasta tener respuestas (o "no sé" en todas).
4. **Registrar:** completar el artefacto y `PROJECT-STATE.md`.
5. **Resumir:** 5–8 bullets de lo decidido + preguntas abiertas + supuestos.
6. **Pedir OK:** "¿Apruebas este artefacto o ajustamos algo?" Sin OK no se avanza.

Duración objetivo por ronda: 10–15 minutos de conversación.

---

## 3. Reglas de preguntas

- Máximo **5 por mensaje**. Más preguntas = respuestas peores.
- Cada pregunta lleva **default recomendado** y la opción "no sé".
- No preguntes lo que ya está en el repo, en el spec o en una respuesta anterior.
- No preguntes dos veces lo mismo con distintas palabras.
- Si el humano se traba, ofrece **2–3 opciones concretas** en vez de una pregunta abierta.
- Pregunta primero lo **irreversible y caro**: producto, alcance, datos, auth, deploy.
- Cierra cada ronda con: "¿Hay algo importante que no te pregunté?"

---

## 4. Supuestos

Cuando la respuesta sea "no sé", "da igual" o ambigua:

1. Propón un default concreto.
2. Regístralo en `PROJECT-STATE.md` como **supuesto**, con:
   - ID (`S-01`), texto, motivo, impacto si es falso, **disparador de validación**
     (ej. "validar con 5 usuarios antes de G6" o "confirmar con el cliente antes de deploy").
3. Nunca presentes un supuesto como decisión.

Un supuesto sin disparador de validación es una bomba de tiempo.

---

## 5. Decisiones y cambios

- Formato: `D-01 | fecha | decisión | motivo | alternativa descartada | reversible (sí/no)`.
- Una decisión **no se edita**: se agrega `D-02` que supersede a `D-01`.
- Si un cambio afecta un artefacto ya aprobado, marca ese artefacto como **`REVISAR`**
  y actualízalo antes de seguir construyendo.
- Los cambios de alcance después de G5 se registran como **scope change** con impacto
  en roadmap y fecha.

---

## 6. Spikes (válvula de escape)

Si el humano necesita ver algo antes de decidir:

- Código descartable en `spikes/`, máximo 1 archivo, sin tests ni estilos definitivos.
- Se declara: pregunta que responde, tiempo límite y qué se hace después.
- Al terminar: se registra el aprendizaje y **se borra o se aísla**. No se promueve a producto
  sin pasar por el gate correspondiente.

---

## 7. Retomar una sesión

Al inicio de cada sesión el agente debe:

1. Leer `state/PROJECT-STATE.md`.
2. Identificar gate actual, artefactos `REVISAR` y preguntas abiertas.
3. Decir en 3 líneas: "Estamos en GX. Falta Y. Propongo Z."
4. Esperar confirmación antes de escribir.

Si el estado no coincide con los archivos, gana el archivo más reciente y se corrige el estado.

---

## 8. Anti-drift

Señales de que el proceso se está desviando:

- Se escribe código antes de G5 → parar, registrar deuda, volver al gate.
- Aparecen features que no están en el roadmap → registrar scope change o rechazar.
- El agente "mejora" cosas no pedidas → revertir y anotar.
- Se repiten preguntas ya respondidas → leer `PROJECT-STATE.md`.
- El spec crece sin cerrar gates → congelar alcance y avanzar.

---

## 9. Cierre del diseño

El diseño termina cuando se puede responder sin dudar:

- ¿Quién usa el sistema y qué hace primero?
- ¿Cuál es la entidad central y cómo se relaciona?
- ¿Quién puede ver y modificar qué?
- ¿Cómo se ve una pantalla típica y qué componentes la forman?
- ¿Cómo se despliega y cómo se detecta un error?
- ¿Cómo sabemos que el primer slice está terminado?

Si alguna respuesta falla, el gate correspondiente sigue abierto.

---

## 10. Delegación en construcción (G6)

Los subagentes se usan **solo** en G6 y bajo `SUBAGENTS.md`.

- Un subagente por **slice independiente**; máximo 2–3 concurrentes.
- **Propiedad de archivos** definida antes de lanzar (tabla `archivo → dueño`).
- **Brief obligatorio:** objetivo, contexto, alcance, criterios, restricciones,
  verificación y formato de salida. Sin brief completo, no se lanza.
- El orquestador integra, verifica y decide. **Ningún subagente aprueba un gate.**
- Tareas acopladas, modelo de datos, auth y arquitectura quedan en el hilo principal.
- El subagente no hereda la conversación: si no está escrito, no existe.

---

## 11. Presupuesto de tokens

Reglas completas en `COST.md`. Resumen:

| Fase | Contexto estable | Lecturas | Output |
|---|---|---|---|
| G0–G5 | Harness + artefacto del gate | Puntuales | Artefacto completo |
| G6 | `AGENTS.md` + spec + acceptance | 2–3 archivos por tarea | Diff + resumen |

- Una sesión por gate o slice; cerrar con `PROJECT-STATE.md` actualizado.
- Prefijo estable primero; **no editarlo a mitad de sesión**.
- Recortar salidas de herramientas (errores, `--stat`, `tail`).
- Responder en bullets + evidencia; `edit` antes que `write`.
- No recortar spec ni criterios de aceptación.

---

## 12. Skills en construcción

Las skills aceleran G6; no reemplazan gates ni decisiones.

- Se cargan **solo si el trigger aplica** (`SKILLS.md` §4).
- Una skill = un procedimiento con pasos, verificación y stop conditions.
- No se usan para producto, datos o arquitectura.
- Si la skill contradice el spec o `AGENTS.md`, gana el spec.
- Toda skill se registra con dueño, estado y fecha de validación.
- Una skill sin verificación no está activa.

Instalación: `.opencode/skills/<name>/SKILL.md`. Plantilla en `skills/_TEMPLATE/`.
