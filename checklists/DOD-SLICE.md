# DOD-SLICE — Definition of Done por slice

> Se completa al cerrar **cada** slice vertical. Sin esto, el slice no está terminado.

**Slice:** [# — nombre] · **Fecha:** [ ] · **Rama/PR:** [ ]

---

## 1. Alcance

- [ ] El slice hace **una sola cosa** y es demostrable
- [ ] No incluye cambios fuera del alcance acordado
- [ ] `git diff --stat` revisado; archivos inesperados, justificados

## 2. Funcional

- [ ] Criterios de aceptación cumplidos (pegar evidencia)
- [ ] Camino feliz funciona de punta a punta
- [ ] Validaciones de entrada
- [ ] Permisos verificados (no solo ocultos en UI)
- [ ] Persistencia correcta (crear, editar, borrar)

## 3. Estados

- [ ] `loading` (skeleton, no spinner global)
- [ ] `error` (mensaje accionable + reintentar)
- [ ] `empty` (explicación + acción)
- [ ] `success` (confirmación visible)
- [ ] Sin permisos → mensaje claro

## 4. UI / UX

- [ ] Sigue los tokens del `DESIGN-SYSTEM` (sin hex sueltos)
- [ ] Responsive 375 / 768 / 1280
- [ ] Foco visible y navegación por teclado
- [ ] Labels y textos según el tono definido
- [ ] Sin layout shift evidente

## 5. Código

- [ ] TypeScript estricto, sin `any` injustificado
- [ ] Sin `@ts-ignore` / lint desactivado sin justificación
- [ ] Lógica de datos separada de presentación
- [ ] Sin duplicación evidente
- [ ] Nombres alineados al dominio del spec
- [ ] Sin secretos ni datos reales en el repo

## 6. Verificación ejecutada

| Comando | Resultado | Salida |
|---|---|---|
| `typecheck` | ✅ / ❌ |  |
| `lint` | ✅ / ❌ |  |
| `build` | ✅ / ❌ |  |
| `test` | ✅ / ❌ |  |

> Pegar el resultado real. "Debería pasar" no cuenta.

## 7. Tests

- [ ] Test del comportamiento nuevo (unit o integration)
- [ ] Caso borde cubierto
- [ ] E2E del flujo crítico (si aplica)

## 8. Cierre

- [ ] `PROJECT-STATE.md` actualizado
- [ ] Supuestos nuevos registrados
- [ ] Deuda técnica anotada con dueño
- [ ] Siguiente slice identificado

---

**Estado:** `DONE` / `DONE con deuda: [..]` / `BLOQUEADO: [..]`
