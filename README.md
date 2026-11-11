# 🧪 HostingLab360 - Recursos Técnicos y Dataset Abierto

Documentación pública y datos abiertos de **[HostingLab360](https://hostinglab360.com.ar)**, laboratorio técnico independiente que audita servicios de alojamiento web en Argentina. Este repositorio conserva guías técnicas, criterios de análisis, el dataset abierto de mediciones y ejemplos educativos; los análisis completos vigentes se publican en el sitio principal.

[![Website](https://img.shields.io/badge/Web-hostinglab360.com.ar-0066cc?style=for-the-badge)](https://hostinglab360.com.ar)
[![Dataset](https://img.shields.io/badge/Dataset-CC_BY_4.0-0d9488?style=for-the-badge)](https://hostinglab360.com.ar/datos)
[![License](https://img.shields.io/badge/Code_License-MIT-green.svg?style=for-the-badge)](LICENSE)

---

## 📊 Dataset Abierto de Rendimiento 2026 (CC BY 4.0)

Publicamos las mediciones consolidadas de latencia (`TTFB`), disponibilidad (`Uptime`) y condiciones comerciales en formato abierto para investigadores, desarrolladores y sistemas de IA:

- 🌐 **Página oficial de Datos Abiertos**: [https://hostinglab360.com.ar/datos](https://hostinglab360.com.ar/datos)
- 📄 **Dataset JSON (en vivo)**: [hosting-stats-2026.json](https://hostinglab360.com.ar/data/hosting-stats-2026.json) | [Copia en este repositorio](dataset/hosting-stats-2026.json)
- 📈 **Dataset CSV (en vivo)**: [hosting-stats-2026.csv](https://hostinglab360.com.ar/data/hosting-stats-2026.csv) | [Copia en este repositorio](dataset/hosting-stats-2026.csv)
- 🤖 **Documentación estructurada para LLMs**: [llms.txt](https://hostinglab360.com.ar/llms.txt) | [llms-full.txt](https://hostinglab360.com.ar/llms-full.txt) | [ai.txt](https://hostinglab360.com.ar/ai.txt)

---

## ⚠️ Alcance de este Repositorio

> **Importante**
> 
> Los scripts publicados en `/scripts-demo` son **ejemplos históricos, básicos y educativos**. No son el stack de pruebas que HostingLab360 utiliza actualmente.
> 
> **No permiten reproducir exactamente** nuestras reviews, rankings ni mediciones actuales. La metodología vigente y los resultados publicados están en el sitio principal.
> 
> Conservamos este material por valor educativo y transparencia histórica, no como especificación del protocolo actual del laboratorio.

📖 **Para más detalles**: Ver [ALCANCE.md](ALCANCE.md) | 🔬 **Reproducibilidad**: Ver [REPRODUCIBILIDAD.md](REPRODUCIBILIDAD.md)

---

## 📋 Sobre el Proyecto

HostingLab360 es un proyecto independiente de análisis y comparativas de **hosting web para Argentina**. Los análisis se basan en:

- ✅ Pruebas reales de rendimiento desde Argentina (TTFB, uptime, velocidad)
- ✅ Análisis técnico de infraestructura
- ✅ Evaluación de soporte y precios en pesos argentinos
- ✅ Comparativas objetivas enfocadas en el mercado local

🌐 **Sitio principal**: [hostinglab360.com.ar](https://hostinglab360.com.ar)

## 📂 Contenido del Repositorio

### `/dataset` - Datos Abiertos de Auditoría
- [hosting-stats-2026.json](dataset/hosting-stats-2026.json) - Métricas estructuradas en JSON
- [hosting-stats-2026.csv](dataset/hosting-stats-2026.csv) - Tabla de métricas en CSV

### `/guides` - Guías Técnicas
- [Cómo evaluar un hosting web](guides/como-evaluar-hosting.md)
- [Métricas de rendimiento: TTFB y Core Web Vitals](guides/metricas-rendimiento.md)
- [Hosting compartido vs VPS: guía técnica](guides/hosting-compartido-vs-vps.md)
- [Checklist: migrar tu sitio a otro hosting](guides/checklist-migracion.md)

### `/scripts-demo` - Ejemplos Históricos Básicos
- [Test de TTFB simple](scripts-demo/test-ttfb.sh) - Mide Time To First Byte
- [Monitor de uptime básico](scripts-demo/monitor-uptime.sh) - Verifica disponibilidad
- [Benchmark de velocidad PHP](scripts-demo/benchmark-php.php) - Prueba rendimiento PHP

> **Importante**: son demostraciones desactualizadas. No representan la infraestructura, frecuencia de medición, controles ni herramientas que utiliza actualmente HostingLab360.

### `/metodologia-publica` - Archivo Metodológico
- [Cómo probamos los hostings](metodologia-publica/proceso-analisis.md)
- [Criterios de evaluación y scoring](metodologia-publica/criterios-ranking.md)

> **Nota**: este material se conserva como archivo educativo. Para conocer el protocolo vigente, consultá la página oficial de [Metodología](https://hostinglab360.com.ar/metodologia).

---

## 🔗 Índice de Documentación y Auditorías en HostingLab360

### Secciones Principales
- 🏠 [Portada y Ranking General](https://hostinglab360.com.ar)
- 🔬 [Metodología y Protocolo de Pruebas](https://hostinglab360.com.ar/metodologia)
- 📊 [Datos Abiertos del Laboratorio](https://hostinglab360.com.ar/datos)
- ⭐ [Índice de Reviews de Proveedores](https://hostinglab360.com.ar/reviews)
- ⚔️ [Índice de Comparativas Directas](https://hostinglab360.com.ar/comparativas)
- 📖 [Centro de Guías Técnicas](https://hostinglab360.com.ar/guias)
- 👤 [Sobre Nosotros y Equipo Técnico](https://hostinglab360.com.ar/nosotros)
- ✍️ [Perfil Técnico: Rafael Scotti](https://hostinglab360.com.ar/autor/rafael-scotti)

### Auditorías Individuales por Proveedor
- [Análisis y Opinión de Hostinger Argentina](https://hostinglab360.com.ar/reviews/hostinger)
- [Análisis y Opinión de WNPower Argentina](https://hostinglab360.com.ar/reviews/wnpower)
- [Análisis y Opinión de Webempresa Argentina](https://hostinglab360.com.ar/reviews/webempresa)
- [Análisis y Opinión de DonWeb Argentina](https://hostinglab360.com.ar/reviews/donweb)
- [Análisis y Opinión de NutHost Argentina](https://hostinglab360.com.ar/reviews/nuthost)
- [Análisis y Opinión de Neolo Argentina](https://hostinglab360.com.ar/reviews/neolo)

### Comparativas Técnicas Mano a Mano
- [Hostinger vs WNPower](https://hostinglab360.com.ar/comparativas/hostinger-vs-wnpower)
- [DonWeb vs Hostinger](https://hostinglab360.com.ar/comparativas/donweb-vs-hostinger)
- [WNPower vs Neolo](https://hostinglab360.com.ar/comparativas/wnpower-vs-neolo)
- [DonWeb vs WNPower](https://hostinglab360.com.ar/comparativas/donweb-vs-wnpower)
- [Hostinger vs Webempresa](https://hostinglab360.com.ar/comparativas/hostinger-vs-webempresa)
- [NutHost vs WNPower](https://hostinglab360.com.ar/comparativas/nuthost-vs-wnpower)

### Guías de Arquitectura y Optimización
- [Guía para elegir hosting en Argentina (2026)](https://hostinglab360.com.ar/guias/guia-elegir-hosting-argentina-2026)
- [Hosting para WordPress en Argentina: pruebas y configuración](https://hostinglab360.com.ar/guias/wordpress-hosting-argentina-2026)
- [VPS vs Hosting Compartido: comparativa de arquitectura](https://hostinglab360.com.ar/guias/vps-vs-hosting-compartido-2026)
- [10 formas de acelerar un sitio web en 2026](https://hostinglab360.com.ar/guias/10-formas-acelerar-sitio-web-2026)

---

## 📄 Licencia

- **Código y scripts de ejemplo**: MIT License - Ver [LICENSE](LICENSE) para más detalles.
- **Dataset de mediciones (`/dataset`)**: Creative Commons Attribution 4.0 International (`CC BY 4.0`) atribuido a [HostingLab360](https://hostinglab360.com.ar).

---

**HostingLab360** - Laboratorio independiente de hosting web en Argentina  
🌐 [hostinglab360.com.ar](https://hostinglab360.com.ar) | 🐙 GitHub: [@hostinglab360](https://github.com/hostinglab360)