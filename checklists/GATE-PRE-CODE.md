# GATE PRE-CÓDIGO — checklist de aprobación

> No se escribe código de producto hasta que **todos** los ítems estén marcados
> o explícitamente aceptados como riesgo por el humano.

**Proyecto:** [ ] · **Fecha:** [ ] · **Aprobado por:** [ ]

---

## A. Producto y alcance (G0–G1)

- [ ] Problema definido en una frase
- [ ] Roles y frecuencia de uso identificados
- [ ] Acción central definida
- [ ] 3–5 features de MVP con criterio de "hecho"
- [ ] Fuera de alcance explícito
- [ ] Métrica de éxito a 90 días
- [ ] Restricciones (fecha, presupuesto, legal) registradas
- [ ] `SPEC.md` aprobado

## B. Datos y permisos (G2)

- [ ] Entidad central e identificadores definidos
- [ ] Relaciones principales documentadas
- [ ] Matriz de roles y permisos completa
- [ ] Datos sensibles identificados con protección
- [ ] Reglas de borrado, retención y exportación
- [ ] Reglas de negocio / invariantes listadas
- [ ] `DATA-MODEL.md` aprobado

## C. Diseño (G3)

- [ ] Tokens de color, tipografía, espaciado y radios definidos
- [ ] Contraste AA verificado
- [ ] Componentes base con variantes y estados
- [ ] Patrones de listado, detalle, formulario y vacío definidos
- [ ] Breakpoints y estrategia responsive
- [ ] Tono y microcopy definidos
- [ ] `DESIGN-SYSTEM.md` aprobado

## D. Técnico y operación (G4)

- [ ] Stack y versiones fijados
- [ ] Estructura de carpetas acordada
- [ ] Estrategia de datos y cache
- [ ] Auth y autorización (validada en servidor)
- [ ] Variables de entorno y secretos
- [ ] Entornos y deploy
- [ ] Estrategia de testing
- [ ] Observabilidad mínima (errores y métricas)
- [ ] Riesgos técnicos con mitigación
- [ ] `ARCHITECTURE.md` aprobado

## E. Verificación y roadmap

- [ ] Criterios de aceptación por feature
- [ ] Casos borde listados
- [ ] Criterios no funcionales (performance, a11y, seguridad)
- [ ] Slices verticales ordenados y demostrables
- [ ] `ACCEPTANCE.md` y `ROADMAP.md` aprobados

## F. Cierre

- [ ] Supuestos abiertos revisados (ninguno crítico sin disparador)
- [ ] Preguntas abiertas resueltas o pospuestas con dueño
- [ ] `PROJECT-STATE.md` actualizado
- [ ] Humano dio OK explícito para construir

---

**Resultado:** `APROBADO` / `BLOQUEADO por: [ítems]`

Si está bloqueado, el agente hace solo las preguntas necesarias para desbloquear.
No implementa "mientras tanto".
