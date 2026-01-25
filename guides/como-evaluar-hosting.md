# Cómo evaluar un servicio de hosting web

Una guía práctica para elegir tu proveedor de hosting basándote en criterios técnicos objetivos.

## 🎯 Introducción

Elegir un hosting web puede ser abrumador con tantas opciones disponibles. Esta guía te ayudará a evaluar proveedores de manera objetiva, más allá del precio y el marketing.

## 📋 Factores Principales a Evaluar

### 1. Rendimiento y Velocidad

El rendimiento es crítico para la experiencia del usuario y el SEO de tu sitio.

#### TTFB (Time To First Byte)
Es el tiempo que tarda el servidor en enviar el primer byte de datos después de recibir una solicitud.

**Benchmarks:**
- ✅ Excelente: < 300ms
- ⚠️ Aceptable: 300-600ms
- ❌ Lento: > 600ms

**Cómo probarlo:**
Usá nuestro [script de prueba TTFB](../scripts/test-ttfb.sh) o herramientas online como:
- WebPageTest.org
- GTmetrix
- Google PageSpeed Insights

#### Core Web Vitals
Google utiliza estas métricas para evaluar la experiencia del usuario:

- **LCP** (Largest Contentful Paint): Debe ser < 2.5s
- **FID** (First Input Delay): Debe ser < 100ms
- **CLS** (Cumulative Layout Shift): Debe ser < 0.1

#### Tiempo de Carga Total
El sitio completo debería cargar en menos de 3 segundos en conexiones 4G.

---

### 2. Estabilidad y Uptime

El uptime mide el porcentaje de tiempo que tu sitio está disponible y accesible.

**Estándar de la industria:**
- ✅ Excelente: ≥ 99.95% (equivale a ~22 minutos de downtime/mes)
- ⚠️ Aceptable: 99.90% (~43 minutos de downtime/mes)
- ❌ Deficiente: < 99.90%

**Cómo verificarlo:**
1. Preguntá por el SLA (Service Level Agreement) del proveedor
2. Buscá reviews independientes sobre su historial
3. Usá herramientas de monitoreo como UptimeRobot (gratuito) durante el período de prueba

**⚠️ Importante:** Muchos proveedores prometen 99.9% pero sin compensación real. Verificá las condiciones del SLA.

---

### 3. Recursos Asignados

#### Para sitios pequeños/medianos (WordPress, tiendas básicas):
- **Espacio en disco**: Mínimo 10GB SSD
- **Ancho de banda**: Ilimitado o > 100GB/mes
- **RAM**: Mínimo 512MB (ideal 1GB+)
- **Bases de datos**: Al menos 2-5
- **Cuentas de email**: 10+ o ilimitadas

#### Para sitios más grandes o con tráfico alto:
Considerá un **VPS** o **hosting VPS** con:
- CPU dedicados (mínimo 2 cores)
- RAM: 2GB+ 
- SSD: 20GB+
- Acceso SSH y root (si necesitás configuraciones personalizadas)

**💡 Tip:** El espacio SSD es mucho más rápido que HDD tradicional. Siempre elegí SSD.

---

### 4. Soporte Técnico

El soporte puede ser la diferencia entre resolver un problema en minutos o perder días de ventas.

#### Evaluar la calidad del soporte:

**Antes de contratar:**
1. Enviá una pregunta técnica por chat/ticket
2. Evaluá el tiempo de respuesta
3. Verificá si la respuesta es técnicamente precisa o solo copy-paste genérico

**Canales importantes:**
- 📧 **Email/Tickets**: Estándar, debe responder en < 24hs
- 💬 **Chat en vivo**: Ideal para problemas urgentes
- 📞 **Teléfono**: Valorable para emergencias críticas
- 📚 **Base de conocimiento**: Documentación útil y actualizada

**Disponibilidad:**
- **24/7** es ideal
- Al menos **horario comercial extendido** (8am-10pm)
- Soporte en **español** (importante para Argentina)

**🚩 Red flags:**
- Respuestas automáticas sin seguimiento
- Soporte solo en inglés para usuarios hispanohablantes
- Foros comunitarios como único medio de soporte

---

### 5. Ubicación de los Servidores

La ubicación física de los servidores afecta la velocidad para tus visitantes.

**Para sitios con audiencia argentina:**
- 🇦🇷 **Ideal**: Servidores en Argentina (Buenos Aires)
- 🇧🇷 **Muy bueno**: Brasil (São Paulo)
- 🇺🇸 **Aceptable**: USA Este (más cercano que Oeste)
- 🇪🇺 **Regular**: Europa (mayor latencia)

**💡 Solución para hosting internacional:** Usá un CDN (Content Delivery Network) como:
- Cloudflare (gratuito)
- Amazon CloudFront
- KeyCDN

---

### 6. Panel de Control

El panel de control es tu interfaz diaria para gestionar el hosting.

**Opciones populares:**
- **cPanel**: El más usado, intuitivo, con muchos tutoriales
- **Plesk**: Moderno, poderoso, ideal para múltiples sitios
- **DirectAdmin**: Ligero y eficiente
- **Paneles propios**: Pueden ser buenos, pero validá que sean completos

**Funciones esenciales:**
- ✅ Gestor de archivos
- ✅ Administrador de bases de datos (phpMyAdmin)
- ✅ Instalador de aplicaciones (Softaculous, WordPress Toolkit)
- ✅ Configuración de email
- ✅ Backups automáticos

---

### 7. Seguridad

#### Elementos de seguridad básicos:

**Obligatorios:**
- ✅ **Certificado SSL gratuito** (Let's Encrypt mínimo)
- ✅ **Firewall** (protección contra ataques)
- ✅ **Backups automáticos** (diarios o semanales)
- ✅ **Protección anti-malware**

**Deseables:**
- Protección DDoS
- Aislamiento de cuentas (en hosting compartido)
- Detección de intrusiones
- Autenticación de dos factores (2FA)

**⚠️ Red flag:** SSL de pago o sin SSL incluido en 2026 es inaceptable.

---

### 8. Precio y Valor

#### No te dejes engañar solo por el precio promocional

**Preguntas clave:**
1. ¿Cuánto cuesta la **renovación**? (A menudo 2-3x el precio inicial)
2. ¿Qué está incluido realmente? (SSL, backups, dominios, etc.)
3. ¿Hay **costos ocultos**? (Migración, certificados, espacio adicional)
4. ¿Cuál es la **política de reembolso**? (Mínimo 15-30 días)

#### Métodos de pago en Argentina
- Tarjeta de crédito/débito (verificá si cobra en USD o ARS)
- Mercado Pago
- Transferencia bancaria
- PayPal

**💡 Tip:** Preguntá explícitamente sobre impuestos (IVA, percepción AFIP) para saber el costo real final.

---

## 🔍 Checklist de Evaluación Práctica

Antes de contratar, verificá:

- [ ] TTFB de su sitio demo o clientes reales
- [ ] Reviews independientes (no solo testimonios propios)
- [ ] Uptime histórico en sitios como [HostingFacts](https://hostingfacts.com)
- [ ] Probá el soporte con una pregunta técnica real
- [ ] Leé los términos de servicio (TOS) y garantía de uptime
- [ ] Verificá el precio de renovación completo
- [ ] Confirmá que incluye SSL gratuito y backups
- [ ] Evaluá la ubicación de los servidores
- [ ] Revisá la política de reembolso (garantía de devolución)
- [ ] Comprobá que el panel de control sea amigable

---

## 🎓 Recursos Adicionales

- [Métricas de rendimiento en hosting](metricas-rendimiento.md)
- [Hosting compartido vs VPS](hosting-compartido-vs-vps.md)
- [Script de prueba TTFB](../scripts/test-ttfb.sh)

---

## 🔗 Análisis Completos

En [HostingLab360](https://hostinglab360.com.ar) aplicamos estos criterios en profundidad para evaluar los mejores proveedores de hosting argentino.

👉 [Ver comparativa completa](https://hostinglab360.com.ar)

---

**Última actualización:** Enero 2026  
**Autor:** HostingLab360 - Análisis técnico independiente
