#!/bin/bash

echo "=== Starting Xray VLESS Server ==="

# Health check - BusyBox nc compatible
while true; do 
    echo -e "HTTP/1.1 200 OK\r\nContent-Length: 2\r\n\r\nOK" | nc -l -p 8888
done &

DOMAIN=${RAILWAY_PUBLIC_DOMAIN:-"YOUR-DOMAIN.up.railway.app"}
UUID=${UUID:-"90f47604-1dc4-4c73-9d67-07dc798a2ac9"}

echo "============================================================"
echo "  UUID   : ${UUID}"
echo "  VLESS  : vless://${UUID}@${DOMAIN}:443?encryption=none&security=tls&type=ws&path=%2Fws&sni=${DOMAIN}#Railway-VLESS"
echo "============================================================"

exec /usr/local/bin/xray run -config /app/config.json
