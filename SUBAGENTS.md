# SUBAGENTS.md — Delegación a subagentes

> **Regla base:** subagentes para **ejecutar en paralelo lo que ya está especificado**,
> no para **decidir lo que todavía no está definido**.

Este documento aplica a partir de **G6 (construcción)**. En G0–G5 el diseño se queda
en el hilo principal: ahí la coherencia vale más que la velocidad.

---

## 1. Principio

- El hilo principal conserva el spec, las decisiones, la coherencia y el gate.
- El subagente recibe una tarea acotada, contexto por archivos, criterios verificables
  y un contrato de salida.
- **Un subagente no hereda la conversación.** Si no está en el brief, no existe.
- El subagente produce evidencia; el orquestador revisa y decide.

---

## 2. Matriz por fase

| Fase | ¿Subagentes? | Qué se delega |
|---|---|---|
| G0 Producto | No | — (como máximo `explore` para reconocimiento) |
| G1 Alcance | No | — |
| G2 Datos | No | — |
| G3 Diseño | No | — |
| G4 Técnico | No | — |
| G5 Gate | No | — |
| G6 Construcción | **Sí** | Slices independientes, tests, revisión, migraciones |

Las decisiones de **arquitectura, modelo de datos, auth y cierre de gate nunca se delegan**.

---

## 3. Cuándo sí

1. **Exploración de repo desconocido** → mapa de archivos, patrones y comandos.
2. **Slices independientes** → features con archivos disjuntos y contrato previo.
3. **Revisión adversarial** → un subagente distinto revisa el diff contra `ACCEPTANCE` y `AGENTS`.
4. **Tests y E2E** → escritos por alguien distinto al implementador.
5. **Verificación de docs/versiones** → reduce los `[VERIFICAR]`.
6. **Migraciones mecánicas** → cambios repetitivos con una regla clara.

---

## 4. Cuándo no

- Tareas de menos de ~5 archivos o de una sola sesión.
- Trabajo acoplado o que comparte estado.
- Archivos que dos subagentes necesitan a la vez.
- Refactors transversales sin interfaces definidas.
- Cuando no puedes escribir un brief preciso: si no lo puedes especificar,
  el subagente tampoco puede ejecutarlo.

---

## 5. Contrato de brief (obligatorio)

Sin estos campos no se lanza un subagente:

```text
Rol: [implementador / revisor / explorador / tester]
Objetivo: una sola cosa, en una frase
Contexto: lee [rutas]; sigue el patrón de [archivo de referencia]
Alcance: puedes tocar [rutas]; NO toques [rutas]
Criterios de aceptación: [lista verificable]
Restricciones: no instalar deps; no cambiar schema; no tocar [X]
Verificación: ejecuta [comandos] y pega la salida
Salida: resumen de 5 bullets + git diff --stat + supuestos + [VERIFICAR]
```

---

## 6. Propiedad de archivos

- Antes de lanzar, escribe una tabla `archivo → dueño`.
- Si dos tareas necesitan el mismo archivo: se serializan o se parte por interfaz.
- Los contratos (tipos, endpoints, props) los define el orquestador **antes** de paralelizar.
- Un subagente no amplía su alcance por iniciativa propia.

| Archivo / módulo | Dueño | Otros |
|---|---|---|
| `src/features/x/**` | subagente A | solo lectura |
| `src/features/y/**` | subagente B | solo lectura |
| `src/lib/api.ts` | orquestador | nadie más |

---

## 7. Límites operativos

- Máximo **2–3 subagentes concurrentes**; empezar con 2.
- Un subagente = una intención. Si necesita dos, se parte.
- **Background** solo para trabajo independiente y largo; **foreground** cuando el resultado
  bloquea el siguiente paso.
- Si no cierra en el tiempo previsto: devuelve hallazgos y se detiene. No improvisa.
- Usar **worktrees** para cambios de código en paralelo y evitar pisarse.

---

## 8. Integración y revisión

1. El orquestador revisa `git diff --stat` y el resumen.
2. Corre la verificación completa: typecheck, lint, build y tests.
3. Revisa coherencia con el spec y el design system.
4. Si hay conflicto entre subagentes, gana el spec; si el spec no lo cubre, decide el humano.
5. **Ningún subagente aprueba un gate ni marca un slice como terminado.**

---

## 9. Anti-patrones

| Anti-patrón | Por qué falla | Corrección |
|---|---|---|
| "Hazme el módulo completo" | dispersión y supuestos | un slice, una intención |
| "Como hablamos antes..." | el subagente no tiene la conversación | brief completo por escrito |
| Paralelizar archivos compartidos | conflictos y merges dolorosos | ownership o serializar |
| Delegar arquitectura o datos | decisiones incoherentes | queda en el hilo principal |
| Aceptar "listo" sin evidencia | errores invisibles | exigir comandos y salida real |
| Brief de una línea | el subagente inventa contexto | contrato de 7 campos |

---

## 10. Checklist antes de lanzar

- [ ] La tarea es aislable y tiene una sola intención
- [ ] Rutas de contexto identificadas
- [ ] Tabla de propiedad de archivos definida
- [ ] Criterios de aceptación verificables
- [ ] Comandos de verificación definidos
- [ ] Contrato de salida acordado
- [ ] Nadie más toca esos archivos
- [ ] El resultado se revisará en el hilo principal
