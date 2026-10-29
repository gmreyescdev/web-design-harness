# DESIGN-SYSTEM — [Nombre del sistema]

> **Estado:** borrador · **Gate:** G3 · **Última actualización:** [fecha]
> Implementación: [Tailwind + shadcn/ui / CSS vars / otro]

## 1. Principios

1. [Ej.: densidad útil — más información por pantalla, sin ruido.]
2. [Ej.: una sola acción primaria por vista.]
3. [Ej.: el estado del sistema siempre es visible.]
4. [Ej.: accesible por defecto, no como parche.]

## 2. Referencias

| Referencia | Qué tomamos | Qué no |
|---|---|---|
|  |  |  |

## 3. Tokens

### Color (semántico, no hex sueltos)

| Token | Uso | Claro | Oscuro |
|---|---|---|---|
| `--bg` | fondo base |  |  |
| `--surface` | tarjetas/paneles |  |  |
| `--border` | divisores |  |  |
| `--text` | texto principal |  |  |
| `--text-muted` | secundario |  |  |
| `--primary` | acción principal |  |  |
| `--primary-fg` | texto sobre primary |  |  |
| `--danger` | error/destructivo |  |  |
| `--success` | confirmación |  |  |
| `--warning` | advertencia |  |  |
| `--focus` | anillo de foco |  |  |

Contraste mínimo: 4.5:1 en texto normal, 3:1 en texto grande y bordes de UI.

### Tipografía

| Rol | Fuente | Tamaño | Peso | Line-height |
|---|---|---|---|---|
| Display |  |  |  |  |
| H1 |  |  |  |  |
| H2 |  |  |  |  |
| Body |  |  |  |  |
| Small |  |  |  |  |
| Mono |  |  |  |  |

Máximo **2 familias**. Escala limitada (ej. 12 / 14 / 16 / 20 / 24 / 32 / 40).

### Espaciado

Base 4px: `4 · 8 · 12 · 16 · 24 · 32 · 48 · 64`.
Regla: [ej. secciones 32/48, entre campos 16, dentro de componentes 8/12].

### Radios, bordes, sombras

| Token | Valor | Uso |
|---|---|---|
| `--radius-sm` |  | inputs pequeños |
| `--radius-md` |  | botones, cards |
| `--radius-lg` |  | modales |
| `--shadow-1` |  | elevación sutil |
| `--shadow-2` |  | popovers/modales |

### Movimiento

| Token | Duración | Easing | Uso |
|---|---|---|---|
| `--motion-fast` | 120ms | ease-out | hover/focus |
| `--motion-base` | 200ms | ease-out | paneles |
| `--motion-slow` | 320ms | ease-in-out | transiciones de página |

Respetar `prefers-reduced-motion`.

## 4. Tema

- Modo: [claro / oscuro / ambos]
- Persistencia: [localStorage / preferencia del sistema]
- Contraste verificado: [ ]

## 5. Layout

- Grid: [12 columnas / max-width]
- Contenedor: [640 / 768 / 1024 / 1280]
- Breakpoints: `sm 640 · md 768 · lg 1024 · xl 1280`
- Navegación: [sidebar / topbar / híbrida]
- Density: [compacta / cómoda]

## 6. Componentes base

| Componente | Variantes | Estados | Notas |
|---|---|---|---|
| Button | primary, secondary, ghost, danger | default, hover, focus, disabled, loading |  |
| Input | text, email, password, search | default, focus, error, disabled | label siempre visible |
| Select |  |  |  |
| Table |  | loading, empty, error |  |
| Card |  |  |  |
| Modal |  |  | foco atrapado |
| Toast | success, error, info |  |  |
| Badge |  |  |  |
| Tabs |  |  |  |
| EmptyState |  |  | acción sugerida |
| Skeleton |  |  |  |

## 7. Patrones de página

- **Listado:** título + acción primaria + filtros + tabla/lista + paginación + estado vacío.
- **Detalle:** breadcrumb + título + metadatos + acciones + contenido + historial.
- **Formulario:** una columna, labels arriba, validación al salir del campo, errores junto al campo, submit fijo.
- **Dashboard:** KPIs arriba (máx. 4), tendencia, tabla de actividad.
- **Vacío:** explicación + acción concreta, nunca solo "no hay datos".
- **Error:** qué pasó, qué puede hacer el usuario, reintentar.
- **Carga:** skeleton con la forma del contenido, no spinner global.

## 8. Accesibilidad

- [ ] Foco visible en todos los interactivos
- [ ] Labels asociados; sin placeholder como único label
- [ ] Navegación completa por teclado
- [ ] Contraste AA verificado
- [ ] `aria-live` para errores y toasts
- [ ] Texto alternativo en imágenes con significado

## 9. Contenido y tono

- Tono: [directo / cercano / formal]
- Regla: verbos en imperativo para acciones ("Guardar cambios", no "Enviar").
- Errores: qué pasó + cómo resolverlo. Nunca culpar al usuario.
- Idioma de la UI: [ ]

## 10. Implementación

- Tokens en: [CSS vars / tailwind.config]
- Librería: [shadcn/ui]
- Iconos: [lucide]
- Fuentes: [ ]
- Regla: prohibido hex sueltos en componentes; solo tokens.
