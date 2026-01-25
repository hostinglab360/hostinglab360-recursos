# Métricas de Rendimiento en Hosting Web

Guía técnica sobre las métricas más importantes para evaluar el rendimiento de un servicio de hosting.

## 📊 Introducción

El rendimiento de un hosting no se mide solo por "qué tan rápido carga". Hay múltiples métricas técnicas que debés conocer para evaluar objetivamente un proveedor.

## 🎯 Métricas Principales

### 1. TTFB (Time To First Byte)

**Definición:** Tiempo que tarda el servidor en enviar el primer byte de datos después de recibir una solicitud HTTP.

**Por qué es importante:**
- Es un indicador directo de la velocidad del servidor
- No depende del tamaño de tu sitio
- Afecta directamente al SEO y experiencia del usuario

**Benchmarks:**
- ✅ **Excelente**: < 200ms (raro pero posible con servidores premium)
- ✅ **Muy bueno**: 200-300ms (ideal para hosting compartido)
- ⚠️ **Aceptable**: 300-500ms
- ⚠️ **Regular**: 500-700ms
- ❌ **Deficiente**: > 700ms

**Cómo medirlo:**

```bash
# Usando curl (Linux/Mac/Git Bash en Windows)
curl -o /dev/null -s -w "TTFB: %{time_starttransfer}s\n" https://tu-sitio.com

# O usá nuestro script
./scripts/test-ttfb.sh https://tu-sitio.com
```

**Herramientas online:**
- WebPageTest.org (opción "First Byte")
- GTmetrix (tab "Timings")
- KeyCDN Performance Test

**Factores que afectan el TTFB:**
- Velocidad del servidor (CPU, RAM, SSD)
- Distancia geográfica servidor-usuario
- Configuración del servidor web (Apache, Nginx, LiteSpeed)
- Optimización de la base de datos
- Cacheo del lado del servidor

---

### 2. Core Web Vitals (Métricas de Google)

Google usa estas métricas para ranking SEO desde 2021.

#### LCP - Largest Contentful Paint

**Definición:** Tiempo hasta que se renderiza el elemento más grande visible en el viewport.

**Benchmarks:**
- ✅ **Bueno**: < 2.5s
- ⚠️ **Necesita mejora**: 2.5-4.0s
- ❌ **Malo**: > 4.0s

**Qué mide:** La velocidad de carga percibida por el usuario.

**Cómo mejorarlo:**
- Optimizar imágenes (WebP, lazy loading)
- Usar CDN
- Implementar caché efectivo
- Mejorar el TTFB del servidor

#### FID - First Input Delay

**Definición:** Tiempo desde que el usuario interactúa (click, tap) hasta que el navegador responde.

**Benchmarks:**
- ✅ **Bueno**: < 100ms
- ⚠️ **Necesita mejora**: 100-300ms
- ❌ **Malo**: > 300ms

**Qué mide:** La capacidad de respuesta e interactividad.

**Cómo mejorarlo:**
- Reducir JavaScript bloqueante
- Dividir código (code splitting)
- Usar Web Workers para tareas pesadas
- Diferir scripts no críticos

#### CLS - Cumulative Layout Shift

**Definición:** Suma de todos los cambios inesperados de layout durante la carga.

**Benchmarks:**
- ✅ **Bueno**: < 0.1
- ⚠️ **Necesita mejora**: 0.1-0.25
- ❌ **Malo**: > 0.25

**Qué mide:** La estabilidad visual durante la carga.

**Cómo mejorarlo:**
- Especificar dimensiones de imágenes y videos
- Reservar espacio para ads y embeds
- Evitar insertar contenido dinámico sobre contenido existente
- Usar `font-display: swap` con cuidado

**Herramientas para medirlos:**
- Google PageSpeed Insights (el más usado)
- Chrome DevTools (Lighthouse)
- Search Console (Core Web Vitals Report)
- Web Vitals Chrome Extension

---

### 3. Uptime y Disponibilidad

**Definición:** Porcentaje de tiempo que el servidor está operativo y accesible.

**Cálculo del downtime permitido:**

| Uptime | Downtime/mes | Downtime/año |
|--------|--------------|--------------|
| 99.99% | ~4 min | ~52 min |
| 99.98% | ~8 min | ~1.7 horas |
| 99.95% | ~22 min | ~4.4 horas |
| 99.90% | ~43 min | ~8.8 horas |
| 99.50% | ~3.6 horas | ~1.8 días |

**Benchmarks:**
- ✅ **Excepcional**: ≥ 99.98%
- ✅ **Muy bueno**: 99.95-99.97%
- ⚠️ **Aceptable**: 99.90-99.94%
- ❌ **Deficiente**: < 99.90%

**Cómo monitorearlo:**
- UptimeRobot (gratuito, chequeo cada 5 min)
- Pingdom
- StatusCake
- Uptime.com

**💡 Tip:** Usá un monitor desde la contratación, no confíes solo en la palabra del proveedor.

---

### 4. Tiempo de Carga Completo

**Definición:** Tiempo total hasta que la página está completamente cargada y funcional.

**Benchmarks:**
- ✅ **Excelente**: < 2s
- ✅ **Bueno**: 2-3s
- ⚠️ **Aceptable**: 3-5s
- ❌ **Lento**: > 5s

**Cómo medirlo:**
- GTmetrix (muestra "Fully Loaded Time")
- WebPageTest
- Google PageSpeed Insights
- Chrome DevTools (Network tab)

**Factores principales:**
- TTFB del servidor ← **Depende del hosting**
- Tamaño de la página ← Optimización de assets
- Número de requests ← Minimización de recursos
- Uso de CDN ← Distribución geográfica
- Calidad de código ← Desarrollo eficiente

---

### 5. Rendimiento del Servidor (Benchmarks PHP/MySQL)

Pruebas sintéticas para medir la potencia bruta del servidor.

#### Benchmark PHP

Script simple que ejecuta operaciones comunes:
- Operaciones matemáticas
- Procesamiento de strings
- Lectura/escritura de archivos

**Usá nuestro script:** [benchmark-php.php](../scripts/benchmark-php.php)

**Benchmarks:**
- ✅ **Excelente**: < 100ms
- ✅ **Bueno**: 100-300ms
- ⚠️ **Regular**: 300-500ms
- ❌ **Lento**: > 500ms

#### Velocidad de MySQL/MariaDB

Tiempo de consultas básicas a la base de datos.

**Cómo probarlo:**
- Ejecutá queries comunes de WordPress
- Medí el tiempo con `BENCHMARK()` de MySQL
- Probá INSERT, SELECT, UPDATE con 10k registros

---

### 6. Velocidad de I/O (Lectura/Escritura en Disco)

**Definición:** Velocidad de lectura y escritura en el almacenamiento.

**Benchmarks (SSD NVMe):**
- ✅ **Excelente**: > 500 MB/s lectura
- ✅ **Bueno**: 200-500 MB/s
- ⚠️ **Regular**: 100-200 MB/s
- ❌ **Lento**: < 100 MB/s (probablemente HDD)

**Cómo medirlo (con acceso SSH):**
```bash
# Escritura
dd if=/dev/zero of=testfile bs=1M count=1024 conv=fdatasync

# Lectura
dd if=testfile of=/dev/null bs=1M count=1024
```

**⚠️ Importante:** SSD es significativamente más rápido que HDD. Siempre elegí SSD (o mejor aún, NVMe).

---

### 7. HTTP/2 y HTTP/3

**Beneficios de HTTP/2:**
- Multiplexación (múltiples requests en una conexión)
- Compresión de headers
- Server Push

**Benchmarks:**
- ✅ HTTP/2 o HTTP/3 activado
- ❌ Solo HTTP/1.1 (obsoleto en 2026)

**Cómo verificar:**
```bash
curl -I --http2 https://tu-sitio.com | grep HTTP
```

O usá: https://tools.keycdn.com/http2-test

---

### 8. Compresión (Gzip/Brotli)

**Definición:** Compresión de assets antes de enviarlos al navegador.

**Benchmarks:**
- ✅ **Ideal**: Brotli activado (mejor compresión)
- ✅ **Bueno**: Gzip activado
- ❌ **Malo**: Sin compresión

**Reducción típica:**
- HTML/CSS/JS: 60-80% con Gzip, 70-85% con Brotli
- Mejora significativa en tiempo de carga

**Cómo verificar:**
```bash
curl -H "Accept-Encoding: gzip,deflate,br" -I https://tu-sitio.com | grep -i "content-encoding"
```

Debería retornar: `content-encoding: gzip` o `content-encoding: br`

---

## 📈 Cómo Interpretar las Métricas

### Priorización para diferentes tipos de sitios:

**Blog/sitio institucional:**
1. TTFB (crítico)
2. Core Web Vitals (SEO)
3. Uptime (confiabilidad)

**E-commerce:**
1. Uptime (cada minuto offline = ventas perdidas)
2. TTFB + Tiempo de carga (conversión)
3. Core Web Vitals (experiencia de compra)

**Aplicación web:**
1. Uptime (funcionalidad)
2. FID (interactividad)
3. Rendimiento del servidor (procesamiento)

---

## 🛠️ Herramientas Recomendadas

### Gratuitas:
- **Google PageSpeed Insights** - Core Web Vitals y diagnóstico
- **GTmetrix** - Análisis completo de rendimiento
- **WebPageTest** - Pruebas avanzadas desde múltiples ubicaciones
- **UptimeRobot** - Monitoreo de uptime
- Nuestros scripts en [`/scripts`](../scripts/)

### De Pago (opcionales):
- **Pingdom** - Monitoreo profesional
- **New Relic** - APM (Application Performance Monitoring)
- **Datadog** - Monitoreo de infraestructura

---

## 🔗 Recursos Relacionados

- [Cómo evaluar un hosting](como-evaluar-hosting.md)
- [Proceso completo de análisis](../metodologia/proceso-analisis.md)
- [Criterios de ranking](../metodologia/criterios-ranking.md)

---

## 📊 Ver Análisis Reales

En [HostingLab360](https://hostinglab360.com.ar) medimos todas estas métricas en profundidad para cada proveedor de hosting argentino.

👉 [Ver comparativa basada en métricas reales](https://hostinglab360.com.ar)

---

**Última actualización:** Enero 2026  
**Autor:** HostingLab360
