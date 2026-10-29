# DATA-MODEL — [Nombre del sistema]

> **Estado:** borrador · **Gate:** G2 · **Última actualización:** [fecha]

## 1. Entidades

| Entidad | Propósito | Identificador | Dueño del dato |
|---|---|---|---|
|  |  | UUID |  |

## 2. Campos por entidad

### [Entidad]

| Campo | Tipo | Nulo | Único | Default | Notas |
|---|---|---|---|---|---|
| id | uuid | no | sí | gen_random_uuid() | PK |
| created_at | timestamptz | no | no | now() |  |

## 3. Relaciones

```text
[Entidad A] 1 ──── N [Entidad B]
[Entidad B] N ──── N [Entidad C]  (tabla puente: [..])
```

## 4. Roles y permisos

| Recurso | Rol A | Rol B | Rol C | Anónimo |
|---|---|---|---|---|
| [entidad] — leer | ✅ | ✅ | ✅ | ❌ |
| [entidad] — crear | ✅ | ✅ | ❌ | ❌ |
| [entidad] — editar | ✅ | solo propios | ❌ | ❌ |
| [entidad] — borrar | ✅ | ❌ | ❌ | ❌ |

## 5. Reglas de negocio / invariantes

- [ ] [Ej.: un pedido no puede pasar a "enviado" sin dirección.]
- [ ] [Ej.: el email es único por organización.]

## 6. Datos sensibles y cumplimiento

| Dato | Sensibilidad | Protección | Retención |
|---|---|---|---|
| email | PII | cifrado en tránsito | hasta borrado |

## 7. Ciclo de vida

- **Creación:** [quién, cómo, validaciones]
- **Edición:** [quién, qué campos, auditoría]
- **Borrado:** [soft/hard, quién, efecto en relaciones]
- **Exportación:** [formato, quién puede]

## 8. Volumen y rendimiento

| Tabla | Filas año 1 | Crecimiento | Consulta crítica | Índice |
|---|---|---|---|---|
|  |  |  |  |  |

## 9. Migraciones y seeds

- Herramienta: [ ]
- Estrategia: [ ]
- Datos de demo: [ ]

## 10. Decisiones y supuestos

| ID | Tipo | Texto | Motivo | Reversible |
|---|---|---|---|---|
| D-01 | decisión |  |  |  |
| S-01 | supuesto |  |  |  |
