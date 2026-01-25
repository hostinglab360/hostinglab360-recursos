# Metodología de Análisis - HostingLab360

## 🔬 Transparencia en Nuestras Pruebas

Todos los análisis publicados en [HostingLab360](https://hostinglab360.com.ar) siguen este proceso sistemático y transparente. Nuestro objetivo es proporcionar datos objetivos y verificables para ayudar a usuarios a elegir el mejor hosting para sus necesidades.

## 1️⃣ Selección de Proveedores

### Criterios de Inclusión
- ✅ Presencia activa en Argentina
- ✅ Soporte técnico en español
- ✅ Opciones de pago en pesos argentinos (ARS)
- ✅ Al menos 2 años de operación continua
- ✅ Infraestructura verificable

### Exclusiones
- ❌ Servicios de reventa sin infraestructura propia
- ❌ Proveedores con antecedentes graves de seguridad
- ❌ Servicios sin soporte verificable

## 2️⃣ Creación de Sitios de Prueba

Para garantizar comparaciones justas, todos los proveedores son evaluados bajo las mismas condiciones:

### Configuración Estándar
- **CMS**: WordPress 6.x (última versión estable)
- **Tema**: Twenty Twenty-Four (tema oficial)
- **Plugins**: 
  - Contact Form 7 (formularios)
  - Yoast SEO (optimización básica)
  - WP Super Cache (caché estándar)
- **Contenido**: 
  - 10 páginas con texto (aprox. 500 palabras cada una)
  - 50 imágenes optimizadas (formato WebP, < 200KB)
  - 5 posts de blog
- **Base de datos**: MySQL/MariaDB con ~100 registros de prueba

### Importante
- ⚠️ **No se aplican optimizaciones artificiales** durante el período de prueba
- ⚠️ **No se contacta al soporte** para mejoras específicas (esto se prueba por separado)
- ⚠️ **El plan contratado** es siempre el de entrada recomendado para WordPress

## 3️⃣ Mediciones Técnicas (30 Días)

### TTFB (Time To First Byte)
- **Herramienta**: curl + script personalizado ([ver script](../scripts/test-ttfb.sh))
- **Frecuencia**: 100 requests distribuidas en horarios aleatorios
- **Origen**: Servidor en Argentina (Buenos Aires)
- **Protocolo**: HTTP/2
- **Métrica**: Promedio de TTFB en milisegundos
- **Benchmark**: 
  - ✅ Excelente: < 300ms
  - ⚠️ Aceptable: 300-600ms
  - ❌ Deficiente: > 600ms

### Uptime y Disponibilidad
- **Herramienta**: UptimeRobot (servicio externo gratuito)
- **Frecuencia**: Ping cada 5 minutos
- **Duración**: 30 días continuos
- **Protocolos**: HTTP/HTTPS + Ping
- **Métrica**: Porcentaje de uptime mensual
- **Benchmark**:
  - ✅ Excelente: ≥ 99.95%
  - ⚠️ Aceptable: 99.90-99.94%
  - ❌ Deficiente: < 99.90%

### Velocidad de Carga
- **Herramienta principal**: Google PageSpeed Insights
- **Herramienta secundaria**: GTmetrix
- **Dispositivos**: Desktop + Mobile
- **Mediciones**: 10 tests en diferentes horarios
- **Métricas evaluadas**:
  - LCP (Largest Contentful Paint)
  - FID (First Input Delay)
  - CLS (Cumulative Layout Shift)
  - Total Blocking Time
  - Speed Index

### Rendimiento del Servidor
- **Script PHP**: [benchmark-php.php](../scripts/benchmark-php.php)
- **Pruebas**:
  - Operaciones matemáticas
  - Procesamiento de strings
  - Consultas MySQL
  - Lectura/escritura de archivos
- **Métrica**: Tiempo de ejecución en milisegundos

### Recursos Asignados
- **CPU**: Verificación de límites y throttling
- **RAM**: Uso de memoria bajo carga
- **I/O**: Velocidad de lectura/escritura en disco
- **Inodes**: Límites de archivos

## 4️⃣ Evaluación de Soporte Técnico

### Canales Evaluados
- 📧 Email / Sistema de tickets
- 💬 Chat en vivo (si está disponible)
- 📞 Teléfono (si está disponible)

### Métricas
- **Tiempo de primera respuesta**: Desde envío hasta respuesta inicial
- **Tiempo de resolución**: Desde consulta hasta solución completa
- **Calidad técnica**: Evaluación de la profundidad y precisión de la respuesta
- **Disponibilidad horaria**: Horarios de atención y cobertura

### Casos de Prueba
1. Consulta técnica simple (ej: cambio de contraseña)
2. Problema técnico medio (ej: error 500)
3. Consulta compleja (ej: optimización de base de datos)

### Scoring
- ✅ Excelente: Respuesta técnica precisa en < 2 horas
- ⚠️ Aceptable: Respuesta útil en < 24 horas
- ❌ Deficiente: Respuesta genérica o > 48 horas

## 5️⃣ Análisis de Precio/Valor

### Evaluación de Costos
- **Precio inicial**: Promoción del primer período
- **Precio de renovación**: Costo real a largo plazo
- **Costos ocultos**: Certificados SSL, backups, migraciones
- **Métodos de pago**: Opciones disponibles en Argentina
- **Política de reembolso**: Garantía de devolución

### Relación Precio/Recursos
Comparamos qué recursos incluye cada plan en relación a su precio:
- Espacio en disco (GB)
- Ancho de banda (mensual)
- Bases de datos incluidas
- Cuentas de email
- Dominios adicionales permitidos

### Benchmark de Valor
Calculamos un "índice de valor" basado en:
```
Valor = (Recursos totales × Factor calidad) / Precio mensual real
```

## 6️⃣ Scoring Final y Ranking

Cada proveedor recibe una puntuación ponderada basada en:

| Categoría | Peso |
|-----------|------|
| Rendimiento (TTFB, velocidad) | 30% |
| Uptime y estabilidad | 25% |
| Soporte técnico | 20% |
| Relación precio/valor | 15% |
| Recursos incluidos | 10% |

**Escala de 0 a 100 puntos**

Los rankings se actualizan cada 3 meses con nuevas mediciones.

---

## 🔄 Actualización de Datos

- **Precios**: Verificados mensualmente
- **Pruebas técnicas**: Repetidas trimestralmente
- **Evaluación de soporte**: Anual o ante cambios significativos

## 📊 Acceso a Datos Completos

Todos los análisis completos están publicados en:  
👉 [hostinglab360.com.ar](https://hostinglab360.com.ar)

## 💬 Contacto

¿Preguntas sobre nuestra metodología?  
📧 info@hostinglab360.com.ar

---

*Última actualización: Enero 2026*
