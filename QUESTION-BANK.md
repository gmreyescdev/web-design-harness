# QUESTION-BANK.md — 6 rondas de preguntas

Cada ronda se responde en **un solo mensaje**. El agente pregunta como máximo 5.
Toda pregunta acepta "no sé": en ese caso se aplica el default y se registra como **supuesto**.

Leyenda: **(D)** = default recomendado si no hay preferencia.

---

## Ronda 1 — Producto y usuarios → `SPEC.md` (G0)

| ID | Pregunta | Por qué importa | Default |
|---|---|---|---|
| P1.1 | ¿Qué es el sistema y qué problema resuelve, en una frase? | Define el norte de todo el diseño. | — |
| P1.2 | ¿Quiénes lo usan? Roles, frecuencia y nivel técnico. | Determina UI, permisos y onboarding. | 2 roles: usuario final + administrador |
| P1.3 | ¿Cuál es la **acción central** que el usuario repite? (el verbo) | Prioriza la pantalla principal y el modelo de datos. | — |
| P1.4 | ¿Cómo se resuelve hoy y qué duele más? | Detecta el problema real y el enemigo del producto. | Planilla + WhatsApp |
| P1.5 | ¿Qué significa éxito a 90 días? Una métrica. | Evita features sin propósito. | "X usuarios hacen Y al menos Z veces/semana" |

**Cierre:** ¿Hay algo del producto que no te pregunté y cambia el diseño?

---

## Ronda 2 — Alcance y límites → `SPEC.md` v1 + `ROADMAP.md` v0 (G1)

| ID | Pregunta | Por qué importa | Default |
|---|---|---|---|
| P2.1 | ¿Cuáles son las 3–5 features del MVP? | Congela el alcance construible. | — |
| P2.2 | ¿Qué queda **explícitamente afuera**? | Evita scope creep y falsas expectativas. | Todo lo que no esté en P2.1 |
| P2.3 | ¿Hay fecha o hito duro? | Define profundidad vs velocidad. | Sin fecha; MVP en 4–6 semanas |
| P2.4 | ¿Quién aprueba y quién usa? ¿Son la misma persona? | Descubre requisitos ocultos del comprador. | El usuario es el aprobador |
| P2.5 | ¿Un solo cliente/organización o multi-tenant? | Cambia modelo de datos, auth y precios. | Single-tenant hasta validar |

**Cierre:** Si tuvieras que lanzar en 2 semanas, ¿qué dos features salvarías?

---

## Ronda 3 — Datos y permisos → `DATA-MODEL.md` (G2)

| ID | Pregunta | Por qué importa | Default |
|---|---|---|---|
| P3.1 | ¿Cuál es la **entidad central** y cómo se identifica? | Es el corazón del modelo. | ID UUID + campo natural único |
| P3.2 | ¿Qué relaciones existen? (1:N, N:M) | Define tablas, joins y pantallas. | — |
| P3.3 | ¿Qué roles hay y qué puede hacer cada uno? | Base de authz y de la UI. | Dueño / editor / lector |
| P3.4 | ¿Hay datos sensibles? (PII, pagos, salud, menores) | Obliga cifrado, retención y legal. | PII mínima: email y nombre |
| P3.5 | ¿Retención, borrado y exportación? | Requisito legal y de confianza. | Borrado a pedido + export CSV |
| P3.6 | ¿Volumen inicial y crecimiento esperado? | Evita sobreingeniería o cuellos de botella. | < 10k filas el primer año |

**Cierre:** ¿Qué dato, si se filtra o se pierde, sería un problema grave?

---

## Ronda 4 — UI, marca y experiencia → `DESIGN-SYSTEM.md` (G3)

| ID | Pregunta | Por qué importa | Default |
|---|---|---|---|
| P4.1 | ¿3 referencias visuales que te gusten? | Ancla el gusto sin adivinar. | Linear, Stripe, Notion |
| P4.2 | ¿Hay marca existente? Logo, colores, tipografía. | Evita inventar identidad. | Neutra; se define en tokens |
| P4.3 | ¿Densidad: dashboard denso o producto aireado? | Define spacing, tablas y navegación. | Aireado con tablas compactas |
| P4.4 | ¿Tema claro, oscuro o ambos? | Multiplica o simplifica tokens. | Claro primero, oscuro después |
| P4.5 | ¿Mobile-first o desktop-first? | Prioriza layouts y pruebas. | Desktop-first con responsive |
| P4.6 | ¿Accesibilidad y navegadores objetivo? | Define contraste y testing. | WCAG AA; últimos 2 de cada motor |

**Cierre:** ¿Hay alguna pantalla que ya tengas imaginada y quieras que sea la referencia?

---

## Ronda 5 — Técnica y operación → `ARCHITECTURE.md` (G4)

| ID | Pregunta | Por qué importa | Default |
|---|---|---|---|
| P5.1 | ¿Stack preferido o libre? | Condiciona todo lo demás. | React + Vite + TS + Tailwind + shadcn/ui + TanStack Query |
| P5.2 | ¿Necesitas SEO/SSR o es una app privada? | Decide SPA vs Next.js. | SPA; Next.js solo si hay marketing público |
| P5.3 | ¿Backend propio, BaaS o serverless? | Define costo, velocidad y control. | Supabase (Postgres + auth + storage) |
| P5.4 | ¿Cómo se autentican los usuarios? | Afecta UX, seguridad y soporte. | Email + password con verificación + Google |
| P5.5 | ¿Integraciones? Pagos, email, storage, analítica. | Define adaptadores y claves. | Stripe, Resend, Supabase Storage, PostHog |
| P5.6 | ¿Dónde se despliega y qué entornos hay? | Determina CI/CD y previews. | Vercel + Supabase; preview por PR |
| P5.7 | ¿Presupuesto mensual de infra? | Evita arquitecturas inviables. | < USD 25/mes hasta validar |

**Cierre:** ¿Hay alguna restricción técnica impuesta (empresa, hosting, legado)?

---

## Ronda 6 — Riesgos y restricciones → `ACCEPTANCE.md` + `ROADMAP.md` v1 (G4)

| ID | Pregunta | Por qué importa | Default |
|---|---|---|---|
| P6.1 | ¿Requisitos legales o regulatorios? (GDPR, facturación, términos) | Cambia datos, textos y flujos. | Privacidad básica + términos |
| P6.2 | ¿Quién mantiene el sistema después y con qué nivel? | Define complejidad aceptable. | El mismo equipo, perfil full-stack |
| P6.3 | ¿Qué es lo más riesgoso del proyecto? | Prioriza spikes y validaciones. | Adopción de usuarios |
| P6.4 | ¿Qué decisión sería cara de revertir? | Obliga a pensarla dos veces. | Modelo de datos y auth |

**Cierre:** ¿Qué te haría cancelar el proyecto? ¿Qué señal lo indica temprano?

---

## Preguntas transversales (usar cuando falte información)

- ¿Quién toma la decisión final si hay desacuerdo?
- ¿Qué pasa si el usuario no tiene conexión o la API falla?
- ¿Qué ocurre con el primer usuario que entra y no hay datos? (estado vacío)
- ¿Cómo se soporta a un usuario que dice "no me funciona"?
- ¿Qué se puede posponer sin romper el valor del MVP?
- ¿Qué dato necesita el negocio que hoy no se captura?
