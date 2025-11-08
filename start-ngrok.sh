#!/bin/bash

# ngrok tunnel setup script
echo "🌐 Map PWA - ngrok HTTPS トンネル設定"
echo "=================================="

# Check if ngrok is installed
if ! command -v ngrok &> /dev/null; then
    echo "❌ ngrok が見つかりません"
    echo "📥 インストール: https://ngrok.com/download"
    echo "🔧 または: brew install ngrok"
    exit 1
fi

echo "🚀 ローカルサーバーを起動中..."

# Start local servers in background
npm start &
SERVER_PID=$!

# Wait for server to start
sleep 2

# Start HTTP server for PWA
python -m http.server 8081 &
HTTP_PID=$!

# Wait for HTTP server
sleep 1

echo "🔒 HTTPS トンネルを作成中..."
echo "   - PWA: ポート 8081"
echo "   - API: ポート 3000"
echo ""

# Create HTTPS tunnel for PWA
ngrok http 8081 --log=stdout &
NGROK_PID=$!

echo "📱 ブラウザでngrokのHTTPS URLにアクセスしてください"
echo "🔄 終了するには Ctrl+C を押してください"

# Cleanup function
cleanup() {
    echo ""
    echo "🛑 サーバーを停止中..."
    kill $SERVER_PID $HTTP_PID $NGROK_PID 2>/dev/null
    exit 0
}

trap cleanup SIGINT
wait