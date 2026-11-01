# 🔬 Reproducibilidad de Ejemplos Históricos

Este documento conserva las limitaciones técnicas de los scripts públicos de `scripts-demo`. Son ejemplos históricos y básicos: **no reproducen el protocolo actual de HostingLab360** ni permiten validar por sí solos las reviews o rankings publicados.

Para conocer el método vigente, consultá [hostinglab360.com.ar/metodologia](https://hostinglab360.com.ar/metodologia).

---

## ✅ Qué ES Reproducible

### 1. Test de TTFB (`scripts-demo/test-ttfb.sh`)

**Qué mide**: Time To First Byte desde tu ubicación

**El script puede ejecutarse**: ✅ Sí
**Reproduce la medición actual del laboratorio**: ❌ No
**Cómo usarlo**:
```bash
bash scripts-demo/test-ttfb.sh https://ejemplo.com
```

**Variabilidad esperada**: ±20-50ms  
**Por qué varía**:
- Tu ubicación geográfica vs desde donde yo pruebo (Argentina)
- Hora del día (congestión de red)
- ISP y routing diferente
- Carga actual del servidor

**Interpretación**:
- Si obtenés ~100ms y yo reporto 120ms → **Consistente** (dentro de variabilidad)
- Si obtenés 600ms y yo reporto 150ms → Revisar configuración/red o ubicación muy diferente

---

### 2. Monitor de Uptime (`scripts-demo/monitor-uptime.sh`)

**Qué mide**: Disponibilidad del servidor en un momento dado

**El script puede ejecutarse**: ✅ Sí
**Reproduce el monitoreo actual del laboratorio**: ❌ No
**Cómo usarlo**:
```bash
bash scripts-demo/monitor-uptime.sh https://ejemplo.com
```

**Variabilidad esperada**: Baja (online/offline es binario)  
**Por qué varía**:
- Mantenimiento temporal del servidor
- Problemas de red intermedios
- Timeouts específicos de tu conexión

**Interpretación**:
- Si obtenés "UP" consistentemente → Server estable
- Si obtenés "DOWN" ocasional → Puede ser tu red o un issue transitorio

---

### 3. Benchmark de PHP (`scripts-demo/benchmark-php.php`)

**Qué mide**: Rendimiento de ejecución PHP del servidor

**El script puede ejecutarse**: ⚠️ Parcialmente
**Reproduce el benchmark actual del laboratorio**: ❌ No
**Cómo usarlo**:
```bash
php benchmark-php.php
```

**Variabilidad esperada**: ±15-30%  
**Por qué varía**:
- Versión de PHP instalada
- Configuración del servidor (memory_limit, max_execution_time)
- Carga actual del servidor compartido
- Caché activo (OPcache, etc.)

**Interpretación**:
- Comparar **tendencias** entre proveedores, no valores absolutos
- Un proveedor consistentemente 2x más rápido → Diferencia real

---

## ❌ Qué NO ES Reproducible

### 1. Monitoreo 24/7 de Uptime

**Por qué no**: Requiere:
- Servicios de monitoreo continuo (uso herramientas externas)
- Configuración y mantenimiento constante
- Almacenamiento de datos históricos
- Setup de alertas

**Alternativa pública**: Ejecutar `monitor-uptime.sh` manualmente o con cron jobs simples

---

### 2. Verificaciones Adicionales de TTFB

**Por qué no**: Requiere:
- Uso de servicios de testing externos específicos
- Configuración de múltiples puntos de medición
- Orquestación de pruebas

**Alternativa pública**: Usar servicios como WebPageTest para comparar desde diferentes ubicaciones

---

### 3. Tests de Carga Intensiva

**Por qué no**: Requiere:
- Herramientas pagas (LoadImpact, BlazeMeter)
- Ancho de banda significativo
- Puede violar TOS de algunos proveedores si se hace sin autorización

**Alternativa pública**: Scripts simples de Apache Bench (ab) o k6 (básico)

---

### 4. Análisis Completo de Seguridad

**Por qué no**: Requiere:
- Scanners comerciales
- Conocimientos especializados
- Puede ser invasivo sin autorización

**Alternativa pública**: SSL Labs para certificados SSL/TLS

---

## 📊 Variabilidad Esperada: Tabla Resumen

| Métrica | Reproducible | Variabilidad Esperada | Factores |
|---------|--------------|----------------------|----------|
| **TTFB** | ✅ Sí | ±20-50ms (~15%) | Ubicación, hora, ISP |
| **Uptime** | ✅ Sí (spot check) | Baja (binario) | Momento específico |
| **Benchmark PHP** | ⚠️ Parcial | ±15-30% | PHP version, carga, config |
| **Uptime 24/7** | ❌ No | No aplicable | Infraestructura |
| **TTFB multi-región** | ❌ No | No aplicable | Infraestructura |
| **Load testing** | ❌ No | No aplicable | Herramientas/costos |

---

## 🛠️ Cómo Usar Estos Scripts Correctamente

### Mejores Prácticas

1. **Ejecutar múltiples veces**: No confíes en una sola medición
   ```bash
   for i in {1..10}; do bash test-ttfb.sh https://ejemplo.com; done
   ```

2. **Comparar proveedores**: Usa los mismos scripts para todos los proveedores que estés evaluando

3. **Controlar variables**: Ejecuta desde la misma máquina, red, y hora del día

4. **Documentar condiciones**: Anota tu ubicación, ISP, hora, para contexto

5. **Buscar tendencias**: Enfócate en diferencias significativas, no pequeñas variaciones

---

## ⚠️ Limitaciones Técnicas

### Limitación 1: Ubicación Geográfica

**Problema**: Los scripts miden desde **tu** ubicación, no desde múltiples regiones.

**Impacto**:
- Resultados variarán según dónde estés
- No refleja performance global del hosting

**Mitigación**:
- Si sos de Argentina y evaluás hosting argentino → Resultados muy relevantes
- Para evaluación global → Usar servicios como WebPageTest, GTmetrix

---

### Limitación 2: Momento Puntual (Snapshot)

**Problema**: Una medición manual es un **snapshot**, no tendencia histórica.

**Impacto**:
- Puede capturar un momento de alta o baja carga
- No refleja consistencia en el tiempo

**Mitigación**:
- Ejecutar scripts varias veces en diferentes momentos
- Considerar nuestras reviews (basadas en monitoreo continuo)

---

### Limitación 3: Hosting Compartido

**Problema**: En hosting compartido, el performance varía según carga de otros usuarios.

**Impacto**:
- Resultados pueden variar significativamente
- Un benchmark puede mostrar resultados diferentes cada vez

**Mitigación**:
- Ejecutar durante diferentes horas del día
- Promediar múltiples mediciones
- Considerar VPS si necesitás performance consistente

---

### Limitación 4: Caché y CDN

**Problema**: Algunos hostings usan caché agresivo o CDN que afectan las mediciones.

**Impacto**:
- TTFB puede ser artificialmente bajo si hay CDN
- Benchmark PHP puede variar si hay OPcache activo

**Mitigación**:
- Deshabilitar CDN temporalmente para testing
- Medir URLs con parámetros aleatorios para evitar caché
- Documentar si el hosting usa CDN

---

## 📈 Interpretación de Resultados

### Ejemplo: Test de TTFB

**Tus resultados**:
```
Medición 1: 145ms
Medición 2: 162ms
Medición 3: 138ms
Promedio: 148ms
```

**Nuestros resultados reportados**: 120ms

**Interpretación**:
✅ **Consistente** - Diferencia de ~28ms (19%) está dentro de variabilidad esperada  
✅ **Ubicación diferente** podría explicar la diferencia  
✅ **No hay red flags** - Ambos están en rango "bueno" (<200ms)

---

### Ejemplo: Benchmark PHP

**Tus resultados**:
```
Operaciones por segundo: 12,500
```

**Nuestros resultados reportados**: 15,000

**Interpretación**:
✅ **Aceptable** - Diferencia de ~17% está dentro de variabilidad esperada  
⚠️ **Podría deberse a**:
- Diferente versión de PHP
- Carga actual del servidor compartido
- Configuración de OPcache

✅ **Acción**: Si es consistentemente más bajo, consultar con el proveedor

---

## 🎯 Caso de Uso: Comparativa Personal

### Escenario

Querés elegir entre **Proveedor A** y **Proveedor B**.

### Proceso Recomendado

1. **Ejecutar test-ttfb.sh en ambos** (10 veces cada uno)
2. **Calcular promedio y desviación estándar**
3. **Ejecutar benchmark-php.php en ambos** (5 veces cada uno)
4. **Comparar resultados**

### Ejemplo de Interpretación

| Métrica | Proveedor A | Proveedor B | Ganador |
|---------|-------------|-------------|---------|
| **TTFB promedio** | 145ms ±15ms | 320ms ±40ms | ⭐ A (2x más rápido) |
| **Benchmark PHP** | 14,000 ops/s | 13,500 ops/s | ~ Empate (similar) |
| **Consistencia TTFB** | Baja variación | Alta variación | ⭐ A (más estable) |

**Conclusión**: Proveedor A tiene mejor performance de red y más estabilidad.

---

## 💡 Recursos Adicionales

### Herramientas Externas Recomendadas

Para complementar nuestros scripts:

- **[WebPageTest](https://www.webpagetest.org/)**: TTFB desde múltiples regiones
- **[GTmetrix](https://gtmetrix.com/)**: Análisis completo de performance
- **[Pingdom](https://tools.pingdom.com/)**: Speed test desde diferentes ubicaciones
- **[SSL Labs](https://www.ssllabs.com/ssltest/)**: Análisis de certificados SSL/TLS

### Servicios de Monitoreo Gratuitos

Para monitoreo básico continuo (sin infraestructura propia):

- **[UptimeRobot](https://uptimerobot.com/)**: Monitoreo gratuito cada 5 minutos
- **[StatusCake](https://www.statuscake.com/)**: Uptime monitoring gratuito
- **[Freshping](https://www.freshworks.com/website-monitoring/)**: Checks desde múltiples ubicaciones

---

## 🔗 Ver También

- [ALCANCE.md](ALCANCE.md) - Qué incluye y NO incluye este repositorio
- [README.md](README.md) - Información general del repositorio
- [metodologia-publica/](metodologia-publica/) - Archivo metodológico educativo

---

## ❓ Preguntas Frecuentes

### ¿Por qué mis resultados difieren de los reportados en sus reviews?

**Causas comunes**:
1. **Ubicación geográfica diferente**
2. **Hora del día** (carga del servidor varía)
3. **ISP y routing** diferentes
4. **Versión PHP** diferente (para benchmarks)
5. **Caché** activo vs desactivado

**Solución**: Ejecutar múltiples veces y comparar **tendencias**, no valores absolutos.

---

### ¿Qué nivel de diferencia es "significativo"?

**Guía general**:

- **TTFB**: >50ms de diferencia consistente → Significativo
- **Benchmark PHP**: >30% de diferencia → Significativo
- **Uptime**: Cualquier downtime → Significativo (si es recurrente)

**Ejemplo**:
- 120ms vs 135ms en TTFB → **No significativo** (variabilidad normal)
- 120ms vs 450ms en TTFB → **MUY significativo** (problema real)

---

### ¿Puedo usar estos scripts para evaluar a mi proveedor actual?

¡Sí! Es uno de los objetivos principales.

**Recomendación**:
1. Ejecutar scripts semanalmente por un mes
2. Documentar resultados
3. Comparar con nuestras reviews
4. Si hay discrepancias significativas → Contactar al proveedor

---

### ¿Cómo reporto discrepancias en sus reviews?

Si tus mediciones difieren significativamente de nuestras reviews:

1. **Documentar**: Capturas de pantalla, logs, múltiples mediciones
2. **Abrir Issue** en GitHub con evidencia
3. **Incluir**: Fecha, hora, ubicación, proveedor, métrica
4. **Revisaremos** y actualizaremos si es necesario

📧 O contactar: contacto@hostinglab360.com.ar

---

**HostingLab360** - Análisis transparente y reproducible  
🌐 [hostinglab360.com.ar](https://hostinglab360.com.ar)
