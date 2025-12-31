# Neovim設定

個人用のNeovim設定ファイルです。LSP、補完、ファジーファインダー、Git統合などを含む、モダンで使いやすいNeovim環境を提供します。

## 必要要件

- Neovim 0.11+
- Git
- Node.js（LSPサーバー用）
- [WezTerm](https://wezfurlong.org/wezterm/)（推奨ターミナルエミュレーター）
- [JetBrains Mono](https://www.jetbrains.com/lp/mono/) フォント

## インストール

```bash
# 設定をクローン
git clone <your-repo-url> ~/.config/nvim

# WezTermのインストール（推奨）
brew install --cask wezterm

# JetBrains Monoフォントのインストール
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono

# Neovimを起動（初回起動時に自動的にプラグインがインストールされます）
nvim
```

## インストール済みプラグイン

### LSP・補完関連
- **mason.nvim**: LSPサーバー、リンター、フォーマッターの管理
- **nvim-lspconfig**: LSP設定フレームワーク
- **nvim-cmp**: 高機能な補完エンジン
- **cmp-nvim-lsp**: LSP補完ソース
- **cmp-buffer**: バッファ内テキスト補完
- **cmp-path**: ファイルパス補完
- **LuaSnip**: スニペットエンジン

### UI/UX
- **lualine.nvim**: カスタマイズされたステータスライン・タブライン
- **bufferline.nvim**: タブスタイルのバッファ表示
- **alpha-nvim**: スタートアップダッシュボード
- **indent-blankline.nvim**: インデントガイド表示
- **nvim-colorizer.lua**: カラーコードのプレビュー表示
- **noice.nvim**: モダンなコマンドライン・通知UI
- **oil.nvim**: ファイルエクスプローラ

### カラーテーマ
- **gruvbox.nvim**: デフォルトテーマ
- **catppuccin**: Catppuccinテーマ
- **tokyonight.nvim**: Tokyo Nightテーマ
- **nord.nvim**: Nordテーマ
- **kanagawa.nvim**: Kanagawaテーマ

### 検索・ナビゲーション
- **telescope.nvim**: ファジーファインダー（ファイル・テキスト検索）
- **plenary.nvim**: Telescope依存ライブラリ

### 編集支援
- **nvim-treesitter**: 高度なシンタックスハイライト
- **nvim-autopairs**: 括弧の自動補完
- **bullets.vim**: Markdown箇条書き自動継続

### Git統合
- **gitsigns.nvim**: Git変更の可視化、ハンク操作

### ターミナル統合
- **toggleterm.nvim**: フローティング・分割ターミナル、Lazygit統合

### その他
- **neoscroll.nvim**: スムーススクロール
- **nvim-web-devicons**: アイコン表示

## 設定されているLSP

- **Lua**: `lua_ls`
- **JavaScript/TypeScript**: `ts_ls`
- **Markdown**: `marksman`

## 🔥 初心者向け：これだけは覚えておけ！

### 最重要キーマッピング

| キー | 説明 | 使用頻度 |
|------|------|----------|
| `jj` | インサートモードを抜ける（Escの代わり） | ⭐⭐⭐⭐⭐ |
| `Ctrl-p` | ファイル検索 | ⭐⭐⭐⭐⭐ |
| `Ctrl-f` | テキスト検索（grep） | ⭐⭐⭐⭐⭐ |
| `<space>w` | ファイル保存 | ⭐⭐⭐⭐⭐ |
| `<space>q` | 終了 | ⭐⭐⭐⭐ |
| `Ctrl-/` | ターミナルのトグル | ⭐⭐⭐⭐ |
| `<space>e` | ファイルエクスプローラ | ⭐⭐⭐⭐ |
| `Tab` / `Shift-Tab` | バッファ切り替え | ⭐⭐⭐⭐ |
| `gd` | 定義へジャンプ（LSP） | ⭐⭐⭐⭐ |
| `K` | ホバー情報表示（LSP） | ⭐⭐⭐⭐ |
| `gr` | 参照一覧（LSP） | ⭐⭐⭐ |

**Note**: `<space>`はスペースキーです（Leaderキー）

### 基本的なワークフロー

1. **ファイルを開く**: `Ctrl-p` でファイル名を検索
2. **コードを編集**: `jj` でノーマルモードに戻る
3. **保存**: `<space>w`
4. **テキストを検索**: `Ctrl-f` でプロジェクト全体から検索
5. **定義を見る**: カーソルを関数や変数に合わせて `gd`
6. **ターミナルを開く**: `Ctrl-/`

## 全キーマッピング一覧

### 基本操作

| キー | モード | 説明 |
|------|--------|------|
| `jj` | Insert | インサートモードを抜ける |
| `<space>w` | Normal | ファイル保存 |
| `<space>q` | Normal | 終了 |
| `<space>x` | Normal | 保存して終了 |
| `Ctrl-a` | Normal | 全選択 |
| `<space>nh` | Normal | 検索ハイライトを消す |

### ファイル・テキスト検索（Telescope）

| キー | モード | 説明 |
|------|--------|------|
| `<space>ff` / `Ctrl-p` | Normal | ファイル検索 |
| `<space>fg` / `Ctrl-f` | Normal | テキスト検索（grep） |
| `<space>fb` | Normal | バッファ検索 |
| `<space><space>` | Normal | バッファ検索（クイック） |
| `<space>fr` | Normal | 最近使ったファイル |
| `<space>/` | Normal | カレントファイル内検索 |
| `<space>fh` | Normal | コマンド履歴 |
| `<space>fH` | Normal | ヘルプ検索 |
| `<space>th` | Normal | カラーテーマピッカー |
| `<space>fs` | Normal | ファイル内シンボル検索 |
| `<space>fS` | Normal | ワークスペース内シンボル検索 |
| `<space>fd` | Normal | 診断情報検索 |

### LSP操作

| キー | モード | 説明 |
|------|--------|------|
| `gd` | Normal | 定義へジャンプ |
| `K` | Normal | ホバー情報表示 |
| `gi` | Normal | 実装へジャンプ |
| `gr` | Normal | 参照一覧 |
| `<C-k>` | Normal | シグネチャヘルプ |
| `<space>rn` | Normal | リネーム |
| `<space>ca` | Normal | コードアクション |

### 補完（nvim-cmp）

| キー | モード | 説明 |
|------|--------|------|
| `Ctrl-Space` | Insert | 補完を表示 |
| `Tab` | Insert | 次の候補 |
| `Shift-Tab` | Insert | 前の候補 |
| `Enter` | Insert | 確定 |
| `Ctrl-e` | Insert | キャンセル |

### ウィンドウ操作

| キー | モード | 説明 |
|------|--------|------|
| `Ctrl-h/j/k/l` | Normal | ウィンドウ間移動 |
| `<space>sv` | Normal | 縦分割 |
| `<space>sh` | Normal | 横分割 |
| `<space>sc` | Normal | ウィンドウを閉じる |
| `Ctrl-Up/Down/Left/Right` | Normal | ウィンドウサイズ調整 |

### バッファ操作

| キー | モード | 説明 |
|------|--------|------|
| `Tab` | Normal | 次のバッファ |
| `Shift-Tab` | Normal | 前のバッファ |
| `<space>bd` | Normal | バッファを閉じる |
| `<space>ba` | Normal | 全バッファを閉じる |

### 編集操作

| キー | モード | 説明 |
|------|--------|------|
| `<` / `>` | Visual | インデント調整（選択維持） |
| `Alt-j` / `Alt-k` | Normal | 行を上下に移動 |
| `Alt-j` / `Alt-k` | Visual | 選択範囲を上下に移動 |
| `<space>d` | Normal | 行を複製 |

### ターミナル操作（toggleterm）

| キー | モード | 説明 |
|------|--------|------|
| `Ctrl-/` | Normal/Terminal | フローティングターミナルをトグル |
| `<space>tf` | Normal/Terminal | フローティングターミナルをトグル |
| `<space>ts` | Normal/Terminal | 横分割ターミナルをトグル |
| `<space>tv` | Normal/Terminal | 縦分割ターミナルをトグル |
| `<space>gg` | Normal/Terminal | Lazygitをトグル |
| `Esc` / `jj` | Terminal | ターミナルモードを抜ける |
| `Ctrl-h/j/k/l` | Terminal | ターミナルからウィンドウ移動 |

### ファイルエクスプローラ（Oil）

| キー | モード | 説明 |
|------|--------|------|
| `<space>e` | Normal | ファイルエクスプローラを開く |

### Git操作（gitsigns）

| キー | モード | 説明 |
|------|--------|------|
| `]c` | Normal | 次のGit変更箇所 |
| `[c` | Normal | 前のGit変更箇所 |
| `<space>gp` | Normal | Git変更のプレビュー |
| `<space>gb` | Normal | Git blame表示をトグル |
| `<space>gd` | Normal | Git diff表示 |

## カラーテーマの変更

```vim
" テーマピッカーを開く
<space>th

" または直接変更
:colorscheme gruvbox
:colorscheme catppuccin
:colorscheme tokyonight
:colorscheme nord
:colorscheme kanagawa
```

選択したテーマは自動的に保存され、次回起動時にも適用されます。

## 言語サポートを追加する方法

### 1. LSPサーバーをインストール

```vim
:Mason
```

Masonのウィンドウで、必要なLSPサーバーを検索してインストール（`i`キーでインストール）。

### 2. lspconfig.luaに設定を追加

`lua/plugins/lspconfig.lua`の`servers`テーブルに新しい言語を追加：

```lua
local servers = {
    lua_ls = {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { 'vim' }
                }
            }
        }
    },
    ts_ls = {},
    marksman = {},

    -- 新しい言語を追加（例：Python）
    pyright = {},
}
```

### 3. Treesitterサポートを追加（オプション）

`lua/plugins/treesitter.lua`の`ensure_installed`に言語を追加：

```lua
ensure_installed = {
    "lua", "javascript", "typescript", "markdown", "markdown_inline",
    "python",  -- 追加
},
```

### 4. Neovimを再起動

設定を反映させるためにNeovimを再起動します。

## トラブルシューティング

### LSPが起動しない

```vim
:LspInfo
```

LSPの状態を確認。サーバーがインストールされているか、正しく設定されているかを確認してください。

### プラグインの再インストール

```vim
:Lazy clean
:Lazy sync
```

### Masonでインストールしたツールが見つからない

```vim
:Mason
```

でインストール状態を確認。必要に応じて再インストール。

### ターミナルが開かない

WezTermまたは互換性のあるターミナルエミュレーターを使用しているか確認してください。

### カラーテーマが正しく表示されない

True colorをサポートするターミナルを使用しているか確認：

```bash
echo $TERM
```

`xterm-256color`または`tmux-256color`が表示されることを確認。

## ファイル構成

```
~/.config/nvim/
├── init.lua                     # エントリーポイント
├── lua/
│   ├── options.lua              # Neovim基本設定
│   ├── keymaps.lua              # キーマッピング
│   └── plugins/                 # プラグイン設定
│       ├── mason.lua            # Mason設定
│       ├── lspconfig.lua        # LSP設定
│       ├── cmp.lua              # 補完設定
│       ├── treesitter.lua       # Treesitter設定
│       ├── telescope.lua        # Telescope設定
│       ├── lualine.lua          # ステータスライン設定
│       ├── bufferline.lua       # バッファライン設定
│       ├── toggleterm.lua       # ターミナル設定
│       ├── gitsigns.lua         # Git統合設定
│       ├── colorscheme.lua      # テーマ設定
│       └── ...                  # その他のプラグイン
└── README.md                    # このファイル
```

## ライセンス

個人使用向けの設定ファイルです。自由に使用・改変してください。
