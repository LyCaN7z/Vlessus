#!/bin/bash

echo "=== Starting Xray VLESS Server ==="

nginx

DOMAIN=${RAILWAY_PUBLIC_DOMAIN:-"YOUR-DOMAIN.up.railway.app"}
UUID="90f47604-1dc4-4c73-9d67-07dc798a2ac9"

echo "============================================================"
echo "  UUID   : ${UUID}"
echo "  DOMAIN : ${DOMAIN}"
echo ""
echo "  VLESS LINK:"
echo "  vless://${UUID}@${DOMAIN}:443?encryption=none&security=tls&type=ws&path=%2Fws&sni=${DOMAIN}#Railway-VLESS"
echo "============================================================"

exec /usr/local/bin/xray run -config /app/config.json
