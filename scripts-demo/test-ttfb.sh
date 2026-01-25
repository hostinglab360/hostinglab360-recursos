#!/bin/bash
# Script de prueba TTFB - HostingLab360
# Mide el Time To First Byte de un sitio web
# Uso: ./test-ttfb.sh https://tu-sitio.com [cantidad-de-requests]

URL="$1"
REQUESTS="${2:-10}"  # Default: 10 requests

# Colores para output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Validación de argumentos
if [ -z "$URL" ]; then
    echo -e "${RED}❌ Error: Debe especificar una URL${NC}"
    echo "Uso: $0 https://ejemplo.com [cantidad-requests]"
    echo ""
    echo "Ejemplos:"
    echo "  $0 https://hostinglab360.com.ar"
    echo "  $0 https://hostinglab360.com.ar 20"
    exit 1
fi

# Verificar que curl está instalado
if ! command -v curl &> /dev/null; then
    echo -e "${RED}❌ Error: curl no está instalado${NC}"
    echo "Instalá curl primero:"
    echo "  Ubuntu/Debian: sudo apt-get install curl"
    echo "  MacOS: brew install curl"
    exit 1
fi

# Banner
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🧪 HostingLab360 - TTFB Test Tool"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "🌐 URL: $URL"
echo "📊 Requests: $REQUESTS"
echo ""
echo "⏳ Ejecutando pruebas..."
echo ""

# Array para almacenar todos los tiempos
declare -a TIEMPOS

# Realizar requests
for i in $(seq 1 $REQUESTS); do
    TTFB=$(curl -o /dev/null -s -w "%{time_starttransfer}" "$URL" 2>/dev/null)
    
    if [ -z "$TTFB" ]; then
        echo -e "${RED}❌ Error en request $i - Verificá la URL${NC}"
        exit 1
    fi
    
    # Convertir a milisegundos para mejor legibilidad
    TTFB_MS=$(echo "$TTFB * 1000" | bc)
    TIEMPOS+=($TTFB)
    
    # Colorear según el valor
    if (( $(echo "$TTFB < 0.3" | bc -l) )); then
        COLOR=$GREEN
        STATUS="✅"
    elif (( $(echo "$TTFB < 0.6" | bc -l) )); then
        COLOR=$YELLOW
        STATUS="⚠️ "
    else
        COLOR=$RED
        STATUS="❌"
    fi
    
    printf "${COLOR}${STATUS} Request %2d: %6.0f ms (%.3f s)${NC}\n" $i $TTFB_MS $TTFB
done

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📈 RESULTADOS"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Calcular estadísticas
TOTAL=0
MIN=${TIEMPOS[0]}
MAX=${TIEMPOS[0]}

for tiempo in "${TIEMPOS[@]}"; do
    TOTAL=$(echo "$TOTAL + $tiempo" | bc)
    
    # Mínimo
    if (( $(echo "$tiempo < $MIN" | bc -l) )); then
        MIN=$tiempo
    fi
    
    # Máximo
    if (( $(echo "$tiempo > $MAX" | bc -l) )); then
        MAX=$tiempo
    fi
done

PROMEDIO=$(echo "scale=3; $TOTAL / $REQUESTS" | bc)
PROMEDIO_MS=$(echo "$PROMEDIO * 1000" | bc)
MIN_MS=$(echo "$MIN * 1000" | bc)
MAX_MS=$(echo "$MAX * 1000" | bc)

# Calcular desviación estándar (simplificado)
SUM_DIFF_SQ=0
for tiempo in "${TIEMPOS[@]}"; do
    DIFF=$(echo "$tiempo - $PROMEDIO" | bc)
    DIFF_SQ=$(echo "$DIFF * $DIFF" | bc)
    SUM_DIFF_SQ=$(echo "$SUM_DIFF_SQ + $DIFF_SQ" | bc)
done
VARIANCE=$(echo "scale=6; $SUM_DIFF_SQ / $REQUESTS" | bc)
STDDEV=$(echo "scale=3; sqrt($VARIANCE)" | bc)
STDDEV_MS=$(echo "$STDDEV * 1000" | bc)

# Calcular variación porcentual
VARIATION=$(echo "scale=1; ($STDDEV / $PROMEDIO) * 100" | bc)

echo ""
printf "⚡ TTFB Promedio:    %6.0f ms (%.3f s)\n" $PROMEDIO_MS $PROMEDIO
printf "📉 TTFB Mínimo:      %6.0f ms (%.3f s)\n" $MIN_MS $MIN
printf "📈 TTFB Máximo:      %6.0f ms (%.3f s)\n" $MAX_MS $MAX
printf "📊 Desviación Est:   %6.0f ms (%.3f s)\n" $STDDEV_MS $STDDEV
printf "🔄 Variación:        %6.1f %%\n" $VARIATION

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🎯 EVALUACIÓN"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Evaluación final basada en benchmarks
if (( $(echo "$PROMEDIO < 0.2" | bc -l) )); then
    echo -e "${GREEN}⭐⭐⭐⭐⭐ EXCEPCIONAL (<200ms)${NC}"
    echo "Rendimiento de servidor premium. Excelente para SEO."
elif (( $(echo "$PROMEDIO < 0.3" | bc -l) )); then
    echo -e "${GREEN}⭐⭐⭐⭐ EXCELENTE (<300ms)${NC}"
    echo "Muy buen rendimiento. Ideal para sitios profesionales."
elif (( $(echo "$PROMEDIO < 0.5" | bc -l) )); then
    echo -e "${YELLOW}⭐⭐⭐ BUENO (<500ms)${NC}"
    echo "Rendimiento aceptable. Considerá optimizaciones."
elif (( $(echo "$PROMEDIO < 0.7" | bc -l) )); then
    echo -e "${YELLOW}⭐⭐ REGULAR (<700ms)${NC}"
    echo "⚠️  Rendimiento por debajo del ideal. Optimización recomendada."
else
    echo -e "${RED}⭐ DEFICIENTE (>700ms)${NC}"
    echo "❌ Rendimiento deficiente. Considerá cambiar de hosting."
fi

echo ""

# Evaluación de consistencia
if (( $(echo "$VARIATION < 10" | bc -l) )); then
    echo -e "${GREEN}✅ Consistencia: EXCELENTE (variación < 10%)${NC}"
elif (( $(echo "$VARIATION < 20" | bc -l) )); then
    echo -e "${YELLOW}⚠️  Consistencia: ACEPTABLE (variación < 20%)${NC}"
else
    echo -e "${RED}❌ Consistencia: IRREGULAR (variación > 20%)${NC}"
    echo "   El servidor muestra rendimiento inconsistente."
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📚 Recursos"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "📖 Guía de métricas: https://github.com/hostinglab360/hostinglab360-recursos"
echo "🔬 Análisis completos: https://hostinglab360.com.ar"
echo ""
