# Criterios de Evaluación y Scoring - HostingLab360

## 📊 Sistema de Puntuación

Cada proveedor de hosting evaluado en [HostingLab360](https://hostinglab360.com.ar) recibe una puntuación de **0 a 100 puntos** basada en criterios objetivos y medibles.

## 🎯 Categorías de Evaluación

### 1. Rendimiento (30 puntos)

**Subcategorías:**

#### TTFB - Time To First Byte (15 puntos)
- **15 pts**: TTFB promedio < 200ms (excepcional)
- **12 pts**: TTFB entre 200-300ms (excelente)
- **9 pts**: TTFB entre 300-450ms (bueno)
- **6 pts**: TTFB entre 450-600ms (aceptable)
- **3 pts**: TTFB entre 600-800ms (regular)
- **0 pts**: TTFB > 800ms (deficiente)

#### Velocidad de Carga (10 puntos)
Basado en Google PageSpeed Insights (promedio Desktop + Mobile):
- **10 pts**: Score ≥ 90 (verde)
- **7 pts**: Score 70-89 (amarillo)
- **4 pts**: Score 50-69 (naranja)
- **0 pts**: Score < 50 (rojo)

#### Core Web Vitals (5 puntos)
- **5 pts**: Todas las métricas en verde (LCP, FID, CLS)
- **3 pts**: 2 de 3 métricas en verde
- **1 pt**: 1 de 3 métricas en verde
- **0 pts**: Ninguna métrica en verde

---

### 2. Uptime y Estabilidad (25 puntos)

#### Uptime Mensual (20 puntos)
Medido durante 30 días con UptimeRobot:
- **20 pts**: ≥ 99.98% (prácticamente perfecto)
- **17 pts**: 99.95-99.97% (excelente)
- **14 pts**: 99.90-99.94% (muy bueno)
- **10 pts**: 99.80-99.89% (aceptable)
- **5 pts**: 99.50-99.79% (regular)
- **0 pts**: < 99.50% (inaceptable)

**Cálculo de downtime permitido:**
- 99.98% = ~8 minutos/mes
- 99.95% = ~22 minutos/mes
- 99.90% = ~43 minutos/mes

#### Consistencia de Rendimiento (5 puntos)
Desviación estándar del TTFB:
- **5 pts**: Variación < 10% (muy consistente)
- **3 pts**: Variación 10-20% (aceptable)
- **1 pt**: Variación 20-30% (irregular)
- **0 pts**: Variación > 30% (muy irregular)

---

### 3. Soporte Técnico (20 puntos)

#### Tiempo de Respuesta (10 puntos)
Promedio de respuesta inicial:
- **10 pts**: < 1 hora (excelente)
- **7 pts**: 1-4 horas (muy bueno)
- **5 pts**: 4-12 horas (bueno)
- **3 pts**: 12-24 horas (aceptable)
- **1 pt**: 24-48 horas (lento)
- **0 pts**: > 48 horas (inaceptable)

#### Calidad Técnica (7 puntos)
Evaluación cualitativa de las respuestas:
- **7 pts**: Solución completa, técnicamente precisa, con detalles
- **5 pts**: Solución correcta pero básica
- **3 pts**: Respuesta genérica pero útil
- **1 pt**: Respuesta poco útil o incorrecta
- **0 pts**: Sin respuesta o irrelevante

#### Disponibilidad de Canales (3 puntos)
- **3 pts**: Ticket + Chat en vivo + Teléfono (24/7 o amplio)
- **2 pts**: Ticket + Chat en vivo (horario limitado)
- **1 pt**: Solo ticket email
- **0 pts**: Sin soporte visible

---

### 4. Relación Precio/Valor (15 puntos)

#### Precio Real Competitivo (8 puntos)
Comparación del precio de renovación vs promedio del mercado argentino:
- **8 pts**: ≤ 70% del promedio (muy económico)
- **6 pts**: 70-90% del promedio (económico)
- **5 pts**: 90-110% del promedio (precio justo)
- **3 pts**: 110-130% del promedio (caro)
- **1 pt**: > 130% del promedio (muy caro)

#### Transparencia de Precios (4 puntos)
- **4 pts**: Precio de renovación claro, sin costos ocultos, garantía de reembolso > 15 días
- **3 pts**: Precio de renovación visible, garantía de reembolso
- **2 pts**: Precios transparentes pero sin garantía
- **0 pts**: Precios confusos o costos ocultos

#### Promociones y Beneficios (3 puntos)
- **3 pts**: Descuentos significativos + extras de valor (dominio, SSL, etc.)
- **2 pts**: Descuentos moderados o algunos extras
- **1 pt**: Descuento mínimo
- **0 pts**: Sin promociones

---

### 5. Recursos Incluidos (10 puntos)

#### Recursos Técnicos (6 puntos)
Evaluación de recursos en plan básico:
- **6 pts**: Recursos ilimitados o muy generosos (>20GB, >10 DB, >10 dominios)
- **4 pts**: Recursos buenos (10-20GB, 5-10 DB, 5-10 dominios)
- **2 pts**: Recursos básicos (5-10GB, 2-5 DB, 2-5 dominios)
- **0 pts**: Recursos limitados (<5GB, 1 DB, 1 dominio)

#### Extras de Valor (4 puntos)
- **4 pts**: SSL gratis + Backups automáticos + CDN + Migraciones gratis
- **3 pts**: SSL gratis + Backups automáticos + 1 extra
- **2 pts**: SSL gratis + Backups
- **1 pt**: Solo SSL gratis
- **0 pts**: Sin extras incluidos

---

## 🏆 Categorías de Ranking

Según la puntuación total:

| Puntuación | Rating | Clasificación |
|------------|--------|---------------|
| 90-100 | ⭐⭐⭐⭐⭐ | Excepcional |
| 80-89 | ⭐⭐⭐⭐ | Excelente |
| 70-79 | ⭐⭐⭐ | Muy bueno |
| 60-69 | ⭐⭐ | Bueno |
| < 60 | ⭐ | Regular |

## 📌 Rankings Especializados

Además del ranking general, creamos categorías específicas:

### 🚀 Mejor Rendimiento
Basado solo en la categoría de Rendimiento (30 pts)

### ⚡ Mejor Uptime
Basado solo en Uptime y Estabilidad (25 pts)

### 💰 Mejor Precio/Calidad
Fórmula especial: `(Puntuación Total × 100) / Precio Mensual ARS`

### 🛠️ Mejor Soporte
Basado solo en Soporte Técnico (20 pts)

### 🎁 Más Completo
Basado en Recursos Incluidos + Extras

---

## 🔄 Proceso de Actualización

- **Rankings generales**: Actualizados trimestralmente
- **Precios y promociones**: Verificados mensualmente
- **Revisión completa**: Re-evaluación cada 6 meses

## ⚖️ Transparencia y Objetividad

### Principios
1. **Sin afiliaciones encubiertas**: Todas las afiliaciones son claramente declaradas
2. **Datos verificables**: Todas las métricas son reproducibles
3. **Criterios públicos**: Esta metodología está disponible públicamente
4. **Actualizaciones documentadas**: Todos los cambios en criterios son registrados

### Política de Integridad
- ❌ **No aceptamos** pagos por posiciones en el ranking
- ❌ **No modificamos** scores por patrocinios
- ✅ **Declaramos** todos los enlaces de afiliados
- ✅ **Mantenemos** los criterios consistentes entre todos los proveedores

---

## 📊 Ejemplo de Puntuación

**Provider Ejemplo:**

| Categoría | Puntos | Detalle |
|-----------|--------|---------|
| Rendimiento | 26/30 | TTFB 220ms (12), PageSpeed 88 (7), CWV 3/3 (5), CPU benchmark 98ms (2) |
| Uptime | 20/25 | 99.97% uptime (17), Variación 8% (3) |
| Soporte | 15/20 | Respuesta 3h (7), Calidad técnica alta (6), Ticket+Chat (2) |
| Precio/Valor | 11/15 | ARS 4.500 vs promedio 5.200 (6), Transparente con garantía (4), Descuento 30% (1) |
| Recursos | 8/10 | 15GB/5DB/5dom (4), SSL+Backups+Migración (4) |
| **TOTAL** | **80/100** | ⭐⭐⭐⭐ **Excelente** |

---

Ver análisis completos aplicando estos criterios en:  
👉 [hostinglab360.com.ar](https://hostinglab360.com.ar)

📧 **Contacto**: info@hostinglab360.com.ar

*Versión: 1.0 - Enero 2026*
