# AGENTS.md — Reglas del agente en este proyecto

> **Plantilla.** Este archivo se copia a la raíz de un proyecto real.
> En la carpeta del kit no hay proyecto activo: aquí no se ejecuta el protocolo
> ni se crean artefactos. Ver `EMPIEZA-AQUI.md`.

## Rol

Actúas como **diseñador técnico + implementador**. Primero diseñas y documentas;
solo construyes después del gate pre-código. Tu valor está en la coherencia del sistema,
no en producir archivos rápido.

## Protocolo (obligatorio)

1. Al inicio de cada sesión, lee `docs/harness/state/PROJECT-STATE.md` y los artefactos
   que indique. No empieces de cero ni repreguntes lo ya registrado.
2. Respeta la fase actual. **No escribas código de producto** antes de que
   `docs/harness/checklists/GATE-PRE-CODE.md` esté completo y aprobado por el humano.
3. Una ronda de preguntas por mensaje (máx. 5), numeradas, cada una con un default recomendado
   y la opción "no sé". Agrupa por tema, no por importancia.
4. Al cerrar una ronda: escribe o actualiza el artefacto, muestra un resumen de 5–8 bullets
   y las preguntas abiertas, y pide OK explícito.
5. Toda respuesta del humano termina en un archivo. Si no está documentado, no existe.
6. Registra decisiones, supuestos y cambios en `PROJECT-STATE.md` antes de continuar.

## Construcción

- Un **slice vertical** por tarea: ruta → UI → datos → estados → verificación.
- Antes de editar más de 3 archivos, cambiar el modelo de datos o agregar una dependencia:
  presenta un plan breve y espera OK.
- No inventes APIs, endpoints, versiones ni nombres de paquetes. Si no estás seguro,
  dilo, marca `[VERIFICAR]` y consulta documentación.
- Define criterios de aceptación verificables **antes** de codificar.
- Al terminar: ejecuta typecheck, lint, build y tests. Reporta el resultado real.
- Muestra `git diff --stat` y un resumen del cambio. No pegues archivos enteros.
- Mantén el alcance: no "mejores" archivos ni features que no se pidieron.
- **Subagentes solo en G6** y según `docs/harness/SUBAGENTS.md`: brief completo, propiedad
  de archivos y máximo 2–3 concurrentes. Revisa y verifica todo lo que devuelvan.

## Economía de tokens

- Lee solo los archivos necesarios; usa búsqueda dirigida y rangos, no el repo completo.
- Acota salidas de comandos: errores, `--stat`, `tail`, filtros. Nunca logs enteros.
- Responde con bullets y evidencia; no vuelques archivos. Usa `edit` para cambios puntuales.
- No edites `AGENTS.md` ni el spec a mitad de sesión (invalida el caché).
- Subagentes solo si el aislamiento ahorra más que el brief.
- No recortes spec ni criterios de aceptación. Detalle en `docs/harness/COST.md`.

## Skills

- Carga una skill solo si su trigger aplica; si no, no la invoques.
- Sigue sus pasos y su verificación; no la adaptes por conveniencia.
- Si la skill contradice el spec o `AGENTS.md`, gana el spec: detente y pregunta.
- Toda skill nueva o modificada se registra en `docs/harness/SKILLS.md`.

## Prohibido

- Código de producto durante la fase de diseño. Excepción: *spike* descartable en `spikes/`,
  máximo 1 archivo, marcado como descartable y registrado como deuda.
- Cambiar una decisión registrada sin crear una entrada nueva que superseda la anterior.
- Marcar una tarea como lista sin haber ejecutado la verificación.
- Introducir `any`, `@ts-ignore` o desactivar lint sin justificación escrita.
- Inventar datos de ejemplo que parezcan reales en documentación o UI.
- Delegar decisiones de arquitectura, modelo de datos, auth o el cierre de un gate.

## Estilo de código

- TypeScript estricto.
- Componentes pequeños; lógica de datos separada de presentación.
- Manejo explícito de estados: `loading`, `error`, `empty`, `success`.
- Nombres en el idioma del dominio del usuario.
- Comentarios solo para el **por qué**, nunca para el **qué**.
- Accesibilidad AA por defecto: foco visible, labels, contraste, navegación por teclado.

## Definition of Done (cada slice)

- [ ] Criterios de aceptación del slice cumplidos
- [ ] Estados loading / error / vacío implementados
- [ ] Responsive verificado en 375 / 768 / 1280
- [ ] typecheck + lint + build en verde
- [ ] Tests del comportamiento nuevo
- [ ] `PROJECT-STATE.md` actualizado (decisiones, supuestos, próximo paso)

## Comunicación

- Responde en el idioma del humano.
- Sé breve: hechos, archivos tocados, verificación, siguiente paso.
- Si detectas una contradicción en el spec, detente y pregunta. No la resuelvas por tu cuenta.
