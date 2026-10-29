# ACCEPTANCE — [Nombre del sistema]

> **Estado:** borrador · **Gate:** G4 · **Última actualización:** [fecha]

## 1. Definition of Done global

- [ ] typecheck sin errores
- [ ] lint sin errores
- [ ] build de producción exitoso
- [ ] tests en verde
- [ ] estados loading / error / vacío en toda vista con datos
- [ ] responsive en 375 / 768 / 1280
- [ ] accesibilidad AA en flujos principales
- [ ] sin secretos en el bundle
- [ ] `PROJECT-STATE.md` actualizado

## 2. Criterios por feature

### F1 — [nombre]

```gherkin
Escenario: [camino feliz]
  Dado que [contexto]
  Cuando [acción]
  Entonces [resultado observable]

Escenario: [error esperado]
  Dado que [contexto]
  Cuando [acción inválida]
  Entonces [mensaje y estado]
```

### F2 — [nombre]

```gherkin
Escenario: ...
```

## 3. Matriz de pruebas

| Feature | Unit | Integration | E2E | Manual |
|---|---|---|---|---|
| F1 |  |  |  |  |
| F2 |  |  |  |  |

## 4. Casos borde

- [ ] Primer usuario sin datos (estado vacío)
- [ ] Datos inválidos o incompletos
- [ ] Sin permisos → 403 visible y comprensible
- [ ] Sesión expirada
- [ ] API caída / timeout
- [ ] Duplicados (doble submit)
- [ ] Textos largos y caracteres especiales
- [ ] Zona horaria y formato de fecha
- [ ] Móvil con teclado abierto

## 5. No funcionales

| Área | Criterio | Cómo se verifica |
|---|---|---|
| Performance | LCP < 2.5s en 3G rápida | Lighthouse |
| Accesibilidad | WCAG AA | axe + teclado manual |
| Seguridad | authz en servidor; RLS activo | revisión + tests |
| SEO | [solo si aplica] |  |

## 6. Datos de prueba

- Seeds: [ ]
- Usuarios de prueba: [ ]
- Entorno: [ ]

## 7. Criterios de release

- [ ] Checklist de DoD completo
- [ ] Migraciones aplicadas y verificadas
- [ ] Backup / rollback probado
- [ ] Variables de producción configuradas
- [ ] Aprobación humana registrada
