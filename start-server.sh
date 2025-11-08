#!/bin/bash

# Map PWA Local Server Launcher
echo "🚀 Map PWA ローカルサーバー起動スクリプト"
echo "======================================"

# Check if in correct directory
if [ ! -f "server.js" ]; then
    echo "❌ エラー: server.js が見つかりません"
    echo "   プロジェクトディレクトリで実行してください"
    exit 1
fi

# Check if node_modules exists
if [ ! -d "node_modules" ]; then
    echo "📦 依存関係をインストール中..."
    npm install
fi

# Create uploads directory
mkdir -p uploads

echo "🔧 サーバー設定:"
echo "   - CSV収集サーバー: http://localhost:3000"
echo "   - アップロードディレクトリ: ./uploads/"
echo ""
echo "🌐 PWAアクセス方法:"
echo "   - ローカル開発: http://localhost:8080 (要別途起動)"
echo "   - GitHub Pages: https://rihohoho.github.io/map_pwa/"
echo ""
echo "⚠️  注意事項:"
echo "   - GitHub Pagesからは直接アップロード不可"
echo "   - ローカル環境でのみサーバーアップロード可能"
echo "   - データはCSVファイルとしてダウンロード可能"
echo ""

# Start the server
echo "🚀 CSVデータ収集サーバーを起動中..."
echo "   終了するには Ctrl+C を押してください"
echo ""

# Run the server
node server.js