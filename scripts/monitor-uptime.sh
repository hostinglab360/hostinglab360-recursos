#!/bin/bash
# Monitor de Uptime Básico - HostingLab360
# Verifica si un sitio está online y registra el resultado
# Uso: ./monitor-uptime.sh https://tu-sitio.com [intervalo-segundos]

URL="$1"
INTERVALO="${2:-300}"  # Default: 300 segundos (5 minutos)
LOG_FILE="uptime_log_$(date +%Y%m%d).txt"

# Colores
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Validación
if [ -z "$URL" ]; then
    echo -e "${RED}❌ Error: Debe especificar una URL${NC}"
    echo "Uso: $0 https://ejemplo.com [intervalo-en-segundos]"
    echo ""
    echo "Ejemplos:"
    echo "  $0 https://hostinglab360.com.ar          # Chequeo cada 5 minutos"
    echo "  $0 https://hostinglab360.com.ar 60       # Chequeo cada 1 minuto"
    exit 1
fi

# Verificar curl
if ! command -v curl &> /dev/null; then
    echo -e "${RED}❌ Error: curl no está instalado${NC}"
    exit 1
fi

# Banner inicial
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🔍 HostingLab360 - Uptime Monitor"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "🌐 URL: $URL"
echo "⏱️  Intervalo: $INTERVALO segundos"
echo "📝 Log: $LOG_FILE"
echo ""
echo "Presioná Ctrl+C para detener el monitoreo"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Contadores
TOTAL_CHECKS=0
SUCCESSFUL_CHECKS=0
FAILED_CHECKS=0

# Función para verificar el sitio
check_site() {
    TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
    
    # Realizar request
    HTTP_CODE=$(curl -o /dev/null -s -w "%{http_code}" --max-time 10 "$URL")
    CURL_EXIT=$?
    
    ((TOTAL_CHECKS++))
    
    if [ $CURL_EXIT -eq 0 ] && [ "$HTTP_CODE" -ge 200 ] && [ "$HTTP_CODE" -lt 400 ]; then
        # Sitio UP
        ((SUCCESSFUL_CHECKS++))
        UPTIME_PERCENT=$(echo "scale=2; ($SUCCESSFUL_CHECKS / $TOTAL_CHECKS) * 100" | bc)
        
        echo -e "${GREEN}✅ [$TIMESTAMP] UP${NC} - HTTP $HTTP_CODE - Uptime: ${UPTIME_PERCENT}%"
        echo "[$TIMESTAMP] UP - HTTP $HTTP_CODE" >> "$LOG_FILE"
    else
        # Sitio DOWN
        ((FAILED_CHECKS++))
        UPTIME_PERCENT=$(echo "scale=2; ($SUCCESSFUL_CHECKS / $TOTAL_CHECKS) * 100" | bc)
        
        if [ $CURL_EXIT -ne 0 ]; then
            ERROR="Connection failed (curl error: $CURL_EXIT)"
        else
            ERROR="HTTP $HTTP_CODE"
        fi
        
        echo -e "${RED}❌ [$TIMESTAMP] DOWN${NC} - $ERROR - Uptime: ${UPTIME_PERCENT}%"
        echo "[$TIMESTAMP] DOWN - $ERROR" >> "$LOG_FILE"
        
        # Notificación (opcional - descomentar si querés recibir alertas)
        # notify-send "⚠️ Sitio Caído" "$URL está inaccesible"
    fi
}

# Función para mostrar resumen al salir
show_summary() {
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "📊 RESUMEN DE MONITOREO"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo "Total de chequeos: $TOTAL_CHECKS"
    echo -e "${GREEN}Exitosos: $SUCCESSFUL_CHECKS${NC}"
    echo -e "${RED}Fallidos: $FAILED_CHECKS${NC}"
    
    if [ $TOTAL_CHECKS -gt 0 ]; then
        UPTIME_PERCENT=$(echo "scale=2; ($SUCCESSFUL_CHECKS / $TOTAL_CHECKS) * 100" | bc)
        echo ""
        echo "🎯 Uptime: ${UPTIME_PERCENT}%"
    fi
    
    echo ""
    echo "📝 Log guardado en: $LOG_FILE"
    echo ""
    exit 0
}

# Capturar Ctrl+C para mostrar resumen
trap show_summary INT

# Loop principal
while true; do
    check_site
    sleep $INTERVALO
done
