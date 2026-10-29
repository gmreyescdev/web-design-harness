# MODEL-NOTES.md — Ajustes para un modelo rápido (DeepSeek Flash)

Este harness existe porque un modelo rápido es **excelente ejecutando** y **frágil asumiendo**.
Estas notas convierten esa realidad en reglas operativas.

---

## 1. Fortalezas que se explotan

| Fortaleza | Cómo se usa |
|---|---|
| Velocidad de iteración | Slices pequeños, muchos ciclos, correcciones rápidas. |
| Buen manejo de patrones | Implementar siguiendo un archivo de referencia del propio repo. |
| Volumen de código | CRUDs, formularios, tests, refactors mecánicos. |
| Disponibilidad | Entrevistas largas, documentación, checklists. |

## 2. Debilidades que se compensan

| Debilidad | Mitigación obligatoria |
|---|---|
| Alucina APIs/versiones | `[VERIFICAR]` + consultar docs antes de usar algo nuevo. |
| Asume contexto faltante | Preguntar o registrar supuesto; nunca rellenar en silencio. |
| Deriva de alcance | Roadmap cerrado + "no toques X" explícito. |
| Olvida decisiones viejas | Todo en `PROJECT-STATE.md`; releer al inicio de sesión. |
| Optimismo al reportar | Verificación ejecutada, no recordada. |
| Cambios amplios innecesarios | Plan antes de >3 archivos; diff acotado. |

---

## 3. Reglas de contexto

1. **Contexto por archivos, no por chat.** Referencia rutas concretas; evita pegar bloques enormes.
2. **Un archivo de referencia.** Para cada patrón nuevo: "sigue el patrón de `ruta/al/archivo.tsx`".
3. **Leer antes de escribir.** Si no leíste el archivo, no lo edites.
4. **Resumir, no re-leer.** Al retomar, `PROJECT-STATE.md` + artefacto del gate; no todo el repo.
5. **Presupuesto:** si una tarea requiere leer más de ~8 archivos, primero pide un mapa
   (o delega a un subagente de exploración).

---

## 4. Reglas de ejecución

1. **Una intención por mensaje.** "Implementa el formulario de alta" > "haz el módulo de usuarios".
2. **Plan primero** si la tarea toca >3 archivos, cambia datos o agrega dependencias.
3. **Criterios antes de código.** Si no hay criterio verificable, el agente lo propone y espera OK.
4. **Verificación real:** `typecheck`, `lint`, `build`, `test`. Si un comando no existe,
   decirlo, no inventarlo.
5. **`git diff --stat` + resumen.** El humano revisa el alcance, no el archivo entero.
6. **Un slice = un commit conceptual.** Si el diff mezcla dos features, se separa.

---

## 5. Anti-alucinación

Antes de afirmar algo técnico, el agente se pregunta:

- ¿Esto existe en la versión que usa el proyecto? → si duda, `[VERIFICAR]`.
- ¿Lo vi en el repo o lo estoy recordando? → si es memoria, verificar.
- ¿El nombre del paquete/función es exacto? → si no, buscar en docs.
- ¿El comando de build es el del proyecto? → leer `package.json`, no suponer.

En documentación: marcar `[VERIFICAR]` en vez de sonar seguro.
Un `[VERIFICAR]` es aceptable; un dato inventado no.

---

## 6. Auto-revisión antes de entregar

Checklist interno (no se muestra salvo que se pida):

- [ ] ¿Toqué solo lo que se pidió?
- [ ] ¿Manejé loading / error / vacío?
- [ ] ¿Los tipos son honestos (sin `any`)?
- [ ] ¿Los nombres coinciden con el dominio del spec?
- [ ] ¿Ejecuté la verificación y leí la salida?
- [ ] ¿Actualicé `PROJECT-STATE.md`?
- [ ] ¿Quedó algún `[VERIFICAR]` sin resolver? ¿Lo comuniqué?

---

## 7. Cuándo delegar

Resumen operativo; el detalle está en `SUBAGENTS.md`.

- **Sí:** exploración de repo, slices independientes, revisión adversarial, tests,
  verificación de docs/versiones y migraciones mecánicas.
- **No:** G0–G5 (producto, datos, diseño, arquitectura), tareas de menos de ~5 archivos,
  trabajo acoplado y cualquier decisión de datos o auth.
- **Regla:** el subagente no hereda la conversación. Sin brief completo de 7 campos, no se lanza.
- **Límite:** 2–3 concurrentes, con propiedad de archivos definida.
- **Revisión crítica** (auth, pagos, migraciones) → revisión humana obligatoria;
  el agente prepara checklist y tests, no la aprobación.

---

## 8. Frases que funcionan

- "Lee A, B y C. Propón un plan de 4 pasos. No edites todavía."
- "Implementa solo el paso 2. Criterios: [...]. Al terminar corre typecheck y tests."
- "¿Qué asumiste que no está en el spec? Lístalo antes de seguir."
- "Marca con [VERIFICAR] todo lo que no puedas confirmar en el repo o en docs."
- "Resume el diff en 5 bullets y dime qué NO tocaste."

## 9. Frases que fallan

- "Hazme toda la app." → dispersión y supuestos.
- "Ya sabes lo que quiero." → no lo sabe; el contexto no persiste solo.
- "Arregla lo que veas." → cambios fuera de alcance.
- "Confío en tu criterio." → aceptable para UI menor; peligroso en datos/auth.

---

## 10. Economía de tokens

Coste relativo: **caché 1× · input nuevo 50× · output 200×**. Reglas completas en `COST.md`.

- Prefijo estable primero; no editarlo a mitad de sesión.
- Recortar lecturas y salidas de herramientas.
- Output en bullets/diffs; `edit` antes que `write`.
- Una sesión por gate o slice; cerrar con `PROJECT-STATE.md` actualizado.
- No recortar spec ni criterios de aceptación para ahorrar.

---

## 11. Skills

Una skill es un **procedimiento**, no una decisión. Se carga solo cuando su trigger aplica.

- Úsalas para tareas repetidas con orden no obvio, riesgo de alucinación o verificación obligatoria.
- No las uses para arquitectura, producto o datos: eso son los gates G0–G5.
- Si la skill contradice el spec, gana el spec.
- La descripción debe tener trigger y exclusión; si es vaga, se activa de más.
- Sin dueño ni fecha de validación, la skill es deuda.

Detalle y registro en `SKILLS.md`.
