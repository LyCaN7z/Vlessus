#!/bin/bash

echo "=== Starting Xray VLESS Server ==="

# Health check server (Railway လိုအပ်တယ်)
while true; do echo -e "HTTP/1.1 200 OK\r\n\r\nOK" | nc -l -p 8888 -q 1; done &

DOMAIN=${RAILWAY_PUBLIC_DOMAIN:-"YOUR-DOMAIN.up.railway.app"}
UUID=${UUID:-"90f47604-1dc4-4c73-9d67-07dc798a2ac9"}

echo "============================================================"
echo "  UUID   : ${UUID}"
echo "  HOST   : junction.proxy.rlwy.net:16678"
echo ""
echo "  VLESS LINK (TCP Proxy):"
echo "  vless://${UUID}@junction.proxy.rlwy.net:16678?encryption=none&security=none&type=ws&path=%2Fws#Railway-VLESS"
echo "============================================================"

exec /usr/local/bin/xray run -config /app/config.json