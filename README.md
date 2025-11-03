# Room Sketch (Doors Only) — Minimal PWA

- レイアウト（ドア）は `config/doors.json` から読み取り **ユーザは編集不可**。
- 部屋サイズのみ（画像なし）。
- スケッチは **指数移動平均 (EMA)** で滑らかに描画・保存。
- CSV出力: `t_ms,x_m,y_m`。

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

