# Room Sketch (Doors Only) — Minimal PWA

# Map PWA Starter

室内マップ描画PWAアプリケーション

## 構成

- **フロントエンド**: PWAアプリ（GitHub Pagesで公開可能）
- **バックエンド**: ローカルCSV収集サーバー

## 使用方法

### 1. ローカルサーバーの起動

```bash
npm install
npm start
```

サーバーは `http://localhost:3000` で起動します。

### 2. PWAアプリの使用

- GitHub Pagesまたは任意のWebサーバーでPWAを公開
- アプリで描画後「CSV」ボタンをクリック
- データが自動的にローカルサーバー（localhost:3000）に送信される
- 接続できない場合は自動的にダウンロードにフォールバック

### 3. データの確認

```bash
# アップロードされたファイル一覧
npm run status

# または直接
curl http://localhost:3000/status
```

アップロードされたCSVファイルは `./uploads/` フォルダに保存されます。

## API エンドポイント

- `POST /upload` - CSVファイルアップロード
- `GET /health` - サーバー状態確認
- `GET /status` - アップロードファイル一覧

## 設定

- 部屋設定: `config/room.json`
- ドア設定: `config/doors.json`

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

