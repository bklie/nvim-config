# Neovim設定

個人用のNeovim設定ファイルです。

## 必要要件

- Neovim 0.11+
- Git

## インストール

```bash
# 設定をクローン
git clone <your-repo-url> ~/.config/nvim

# Neovimを起動（初回起動時に自動的にプラグインがインストールされます）
nvim
```

## 構成

### プラグイン管理

- **lazy.nvim**: プラグインマネージャー

### インストール済みプラグイン

- **LSP関連**
  - `mason.nvim`: LSPサーバー管理
  - `nvim-lspconfig`: LSP設定
  - `nvim-cmp`: 補完エンジン
  - `cmp-nvim-lsp`: LSP補完ソース
  - `cmp-buffer`: バッファ補完
  - `cmp-path`: パス補完
  - `LuaSnip`: スニペットエンジン

- **UI/UX**
  - `lualine.nvim`: ステータスライン
  - `noice.nvim`: コマンドライン・通知UI
  - `oil.nvim`: ファイルエクスプローラ
  - `telescope.nvim`: ファジーファインダー

- **編集支援**
  - `nvim-treesitter`: シンタックスハイライト
  - `nvim-treesitter-context`: コンテキスト表示
  - `nvim-autopairs`: 括弧自動補完

### 設定されているLSP

- **Lua**: `lua_ls`
- **JavaScript/TypeScript**: `ts_ls`
- **Markdown**: `marksman`

## キーマッピング

### 基本

- `jj`: Escapeキー（インサートモード）
- `<space>f`: フォーマット

### LSP

- `gd`: 定義へジャンプ
- `K`: ホバー情報表示
- `gi`: 実装へジャンプ
- `gr`: 参照一覧
- `<C-k>`: シグネチャヘルプ
- `<space>rn`: リネーム
- `<space>ca`: コードアクション

### 補完

- `<C-Space>`: 補完を表示
- `Tab/Shift-Tab`: 候補選択
- `Enter`: 確定
- `<C-e>`: キャンセル

## 言語サポートを追加する方法

1. Masonで必要なLSPサーバーをインストール:
   ```vim
   :Mason
   ```

2. `lua/plugins/lspconfig.lua`の`servers`テーブルに設定を追加:
   ```lua
   servers = {
       -- 既存の設定...

       -- 新しい言語を追加
       pyright = {},  -- Python用の例
   }
   ```

3. Neovimを再起動

## トラブルシューティング

### LSPが起動しない

```vim
:LspInfo
```
でLSPの状態を確認してください。

### プラグインの再インストール

```vim
:Lazy clean
:Lazy sync
```
