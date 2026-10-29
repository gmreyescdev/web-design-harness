# ROADMAP — [Nombre del sistema]

> **Estado:** borrador · **Gate:** G1 (v0) / G4 (v1) · **Última actualización:** [fecha]

## 1. Hitos

| Hito | Contenido | Criterio de cierre | Fecha objetivo |
|---|---|---|---|
| H1 — Esqueleto | app corriendo, auth, layout, deploy | preview accesible |  |
| H2 — Núcleo | F1 + F2 completas | criterios de aceptación |  |
| H3 — Operación | F3 + panel admin |  |  |
| H4 — Lanzamiento | pulido, métricas, legal | release checklist |  |

## 2. Slices verticales

| # | Slice | Valor que entrega | Depende de | Criterio de cierre | Estado |
|---|---|---|---|---|---|
| 1 | Setup + deploy | pipeline funcionando | — | preview + CI verde | pendiente |
| 2 | Auth | entrar/salir con seguridad | 1 | login, logout, sesión expirada | pendiente |
| 3 | [F1 núcleo] |  | 2 |  | pendiente |
| 4 | [F1 detalle] |  | 3 |  | pendiente |
| 5 | [F2] |  | 2 |  | pendiente |
| 6 | [Panel admin] |  | 3 |  | pendiente |

Regla: cada slice es **demostrable** y **verificable** por sí mismo.

## 3. Orden y dependencias

```text
1 ─► 2 ─► 3 ─► 4
         └─► 5 ─► 6
```

## 4. Riesgos de secuencia

| Riesgo | Señal temprana | Plan B |
|---|---|---|
|  |  |  |

## 5. Scope changes

| ID | Fecha | Cambio | Impacto | Decisión |
|---|---|---|---|---|
| SC-01 |  |  | +[días] | aceptado / pospuesto / rechazado |

## 6. Fuera de este roadmap

- [ ] [feature] — revisar después del lanzamiento
