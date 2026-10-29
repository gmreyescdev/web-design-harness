# ARCHITECTURE — [Nombre del sistema]

> **Estado:** borrador · **Gate:** G4 · **Última actualización:** [fecha]

## 1. Resumen

[3–5 frases: tipo de app, dónde corre, cómo se accede a los datos, qué se prioriza.]

## 2. Stack y versiones

| Capa | Tecnología | Versión | Motivo |
|---|---|---|---|
| UI |  |  |  |
| Routing |  |  |  |
| Estado/datos |  |  |  |
| Estilos |  |  |  |
| Backend |  |  |  |
| Base de datos |  |  |  |
| Auth |  |  |  |
| Tests |  |  |  |
| Deploy |  |  |  |

## 3. Estructura de carpetas

```text
src/
  app/            # rutas y layouts
  features/       # una carpeta por dominio
    [feature]/
      components/
      hooks/
      api.ts
      types.ts
  components/ui/  # primitivos compartidos
  lib/            # utilidades, clientes, configuración
  styles/
```

Regla: una feature no importa internals de otra; comparte por `components/ui` o `lib`.

## 4. Rutas y navegación

| Ruta | Pantalla | Acceso | Datos |
|---|---|---|---|
| `/` |  | público |  |
| `/login` |  | público |  |
| `/app` |  | autenticado |  |

## 5. Capa de datos

- Cliente: [Supabase / fetch / tRPC]
- Cache: [TanStack Query — staleTime, invalidación]
- Mutaciones: [optimistas / invalidar query]
- Errores: [mapeo a mensajes de UI]
- Paginación: [cursor / offset]

## 6. Autenticación y autorización

- Proveedores: [email, Google, SSO]
- Sesión: [JWT / cookie httpOnly]
- Roles: [ ]
- Regla de oro: **la autorización se valida en el servidor**, nunca solo en la UI.
- RLS / políticas: [sí/no, dónde]

## 7. Variables de entorno

| Variable | Entorno | Secreta | Uso |
|---|---|---|---|
| `VITE_...` | todos | no | cliente |
| `..._SECRET` | server | sí | nunca al bundle |

Regla: `.env.example` versionado; secretos solo en el proveedor.

## 8. Errores y observabilidad

- Errores de UI: [toast + boundary]
- Logging: [ ]
- Métricas: [ ]
- Alertas: [ ]

## 9. Entornos y deploy

| Entorno | URL | Datos | Deploy |
|---|---|---|---|
| local |  | seeds |  |
| preview |  | aislados | por PR |
| producción |  | reales | main |

- CI: [typecheck, lint, test, build]
- Rollback: [ ]

## 10. Testing

| Nivel | Herramienta | Qué cubre |
|---|---|---|
| unit |  | lógica pura |
| integration |  | feature + datos |
| e2e |  | flujos críticos |

## 11. Riesgos técnicos

| Riesgo | Probabilidad | Impacto | Mitigación |
|---|---|---|---|
|  |  |  |  |

## 12. ADRs

| ID | Decisión | Alternativas | Consecuencia |
|---|---|---|---|
| ADR-01 |  |  |  |
