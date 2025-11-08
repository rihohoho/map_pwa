# Room Sketch (Doors Only) — Minimal PWA

# Map PWA Starter

室内マップ描画PWAアプリケーション

## 🌐 利用方法

### オンライン版 (推奨)
**GitHub Pages**: https://rihohoho.github.io/map_pwa/

- ✅ インストール不要
- ✅ スマートフォン・タブレット対応  
- ✅ PWA機能（ホーム画面追加可能）
- 📥 CSVデータは自動ダウンロード

### ローカル開発版
```bash
# 1. リポジトリをクローン
git clone https://github.com/rihohoho/map_pwa.git
cd map_pwa

# 2. 簡単起動（推奨）
./start-server.sh

# 3. 手動起動
npm install
npm start
```

## 📊 データ収集の違い

| 環境 | アクセス方法 | データ保存 | 備考 |
|------|-------------|-----------|------|
| **GitHub Pages** | https://rihohoho.github.io/map_pwa/ | 📥 CSVダウンロード | HTTPS制限によりローカルサーバー接続不可 |
| **ローカル開発** | http://localhost:8080 | 🚀 サーバーアップロード | ./uploads/ に自動保存 |

## 🔧 ローカルサーバー構成

- **フロントエンド**: PWAアプリ
- **バックエンド**: ローカルCSV収集サーバー（ポート3000）

### API エンドポイント

- `POST /upload` - CSVファイルアップロード
- `GET /health` - サーバー状態確認  
- `GET /status` - アップロードファイル一覧

### ファイル確認

```bash
# アップロードファイル一覧
npm run status

# または直接
curl http://localhost:3000/status
```

## 🎯 使用手順

1. **アプリにアクセス**
   - オンライン: https://rihohoho.github.io/map_pwa/
   - ローカル: ./start-server.sh 実行後 http://localhost:8080

2. **マップ描画**
   - タッチ/マウスでパスを描画
   - グリッド番号が表示される

3. **データエクスポート**
   - 「CSV」ボタンをクリック
   - ローカル環境: サーバーに自動アップロード
   - オンライン: CSVファイルを自動ダウンロード

## 📁 設定ファイル

- **部屋設定**: `config/room.json` - 部屋サイズ、グリッド設定
- **ドア設定**: `config/doors.json` - ドア位置、サイズ

## 🛠 開発・カスタマイズ

### ローカル開発環境
```bash
# 依存関係インストール
npm install

# サーバー起動
npm start

# PWA開発サーバー（別ターミナル）
python -m http.server 8080
```

### PWA機能
- ✅ オフライン対応
- ✅ インストール可能
- ✅ レスポンシブデザイン
- ✅ タッチ操作最適化

## 設定
- `config/room.json`
- `config/doors.json` (例)
```json
{"doors":[
  {"a":{"x":1.0,"y":0.0},"b":{"x":1.9,"y":0.0},"width_m":0.9},
  {"a":{"x":5.0,"y":6.2},"b":{"x":5.9,"y":6.2},"width_m":1.0}
]}
```

## 使い方
- 画面でそのまま描画 → 「CSV」で保存 → 「リセット」で消去。

## 調整
- 滑らかさは `index.html` の `SMOOTH_ALPHA` (0.15〜0.35 推奨) を変更。

