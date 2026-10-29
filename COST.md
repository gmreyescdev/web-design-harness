# COST.md — Economía de tokens

> Precios de referencia: DeepSeek V4.1 Flash, octubre 2026. **`[VERIFICAR]`** si el proveedor
> los cambia. El objetivo no es gastar menos por gastar: es **no pagar contexto que no se usa**.

---

## 1. La aritmética

| Concepto | USD / 1M tokens | Coste relativo |
|---|---|---|
| Lectura de caché | **0.003** | **1×** |
| Input nuevo | **0.15** | **50×** |
| Output | **0.60** | **200×** |

Fórmula aproximada (USD):

```text
costo ≈ 0.15 × input_nuevo + 0.003 × input_cacheado + 0.60 × output   (por millón)
```

El coste lo dominan, en orden:

1. **Input nuevo**: salidas de herramientas, archivos leídos, logs, diffs completos.
2. **Output**: código generado y explicaciones.
3. **Contexto repetido**: barato si está cacheado, caro si se reescribe o se reordena.

El *cache write* es 0: preparar el prefijo no cuesta extra. Lo que cuesta es **invalidarlo**.

---

## 2. Las 5 palancas

### 2.1 Disciplina de caché (hasta ~98% en contexto repetido)

- Lo estable primero: `AGENTS.md`, spec, convenciones. Lo dinámico al final.
- **No edites `AGENTS.md` ni el spec a mitad de sesión**: invalida el prefijo cacheado detrás.
- No reordenes archivos ni repitas contexto ya cargado.
- Si hay que cambiar instrucciones base, abrí sesión nueva.

### 2.2 Recortar input nuevo de herramientas (50× el caché)

- `grep`/`glob` primero; leer solo el rango necesario (`offset`/`limit`).
- Builds y tests: solo el error o las últimas líneas, no el log completo.
- `git diff --stat` en vez del diff entero; después mirar solo el archivo relevante.
- No pegar archivos en el chat si se pueden leer por ruta.
- Evitar `cat` de JSON enormes; pedir solo la clave que importa.

### 2.3 Recortar output (200× el caché, 4× el input)

- "Resumen de 5 bullets + `git diff --stat`", no archivos enteros.
- `edit` para cambios puntuales; `write` solo para archivos nuevos.
- No repetir código que ya está en el repo.
- No explicar lo obvio; sí explicar decisiones y riesgos.

### 2.4 Enrutar modelos

- **Flash** para ejecución, UI, tests, refactors y CRUDs.
- **Pro** solo para arquitectura, revisión crítica o cuando Flash falla dos veces.
- No usar un modelo más caro para tareas mecánicas.

### 2.5 Subagentes con criterio

Cada subagente paga su propio priming (brief + archivos) a precio de input nuevo
y **no comparte el caché** del hilo principal.

- Solo si el aislamiento ahorra más de lo que cuesta el brief.
- Nunca para tareas de 2 archivos.
- 2–3 concurrentes como máximo. El paralelismo ahorra tiempo, no tokens.

---

## 3. Ejemplo numérico

100k de contexto estable + 10k de input nuevo + 2k de output:

| Escenario | Cálculo | Coste |
|---|---|---|
| Con caché | 100k×0.003 + 10k×0.15 + 2k×0.60 | **USD 0.003** |
| Sin caché | 110k×0.15 + 2k×0.60 | **USD 0.0177** |

Casi **6× más caro** por no cuidar el prefijo.

---

## 4. Presupuesto por fase

| Fase | Contexto estable | Lecturas | Output | Regla |
|---|---|---|---|---|
| G0–G5 | Harness + artefacto del gate | Puntuales, por pregunta | Artefacto completo | Una sesión por gate; sin código |
| G6 | `AGENTS.md` + spec + acceptance | 2–3 archivos por tarea | Diff + resumen | Una sesión por slice |
| Revisión | Diff + criterios | Solo archivos tocados | Reporte de cumplimiento | Subagente distinto al implementador |

---

## 5. Reglas operativas (obligatorias)

1. **Una sesión por gate o por slice.** Al cerrar: escribir el estado y arrancar limpio.
2. **Leer `PROJECT-STATE.md` + 2–3 archivos**, no el repo entero.
3. **Mapa antes de leer:** `grep`/`glob`, luego rangos concretos.
4. **Acotar salidas de comandos:** errores, `--stat`, `tail`, filtros. Nunca logs enteros.
5. **Responder en bullets + evidencia.** No volcar código. `edit` antes que `write`.
6. **Subagentes solo en G6**, con brief completo y propiedad de archivos.
7. **No recortar spec ni criterios de aceptación.** El token más caro es el que evita
   una implementación equivocada.
8. **No editar el prefijo estable a mitad de sesión** (`AGENTS.md`, spec, convenciones).
9. **Cargar skills solo si el trigger aplica.** El cuerpo de la skill es input nuevo;
   una skill que no se usa también se paga.

---

## 6. Checklist por turno

- [ ] ¿Estoy leyendo solo lo necesario?
- [ ] ¿Acoté la salida del comando?
- [ ] ¿Puedo responder en 5 bullets?
- [ ] ¿Usé `edit` en vez de reescribir el archivo?
- [ ] ¿Este subagente se paga solo?
- [ ] ¿Cargué una skill que no aplica?
- [ ] ¿Toqué el prefijo estable?
- [ ] ¿Recorté algo que necesitaba para ahorrar? (si sí, revertir)
