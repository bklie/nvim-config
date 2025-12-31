-- ================================================
-- キーマッピング設定
-- ================================================

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- ================================================
-- 基本操作
-- ================================================

-- インサートモードを抜ける
keymap('i', 'jj', '<Esc>', opts)

-- クイックセーブ
keymap('n', '<leader>w', ':w<CR>', { desc = 'Save file' })
keymap('n', '<leader>q', ':q<CR>', { desc = 'Quit' })
keymap('n', '<leader>x', ':x<CR>', { desc = 'Save and quit' })

-- 全選択
keymap('n', '<C-a>', 'ggVG', { desc = 'Select all' })

-- ================================================
-- ファイル検索（Telescope）
-- ================================================

-- ファイル検索（最重要！）
keymap('n', '<leader>ff', ':Telescope find_files<CR>', { desc = 'Find files' })
keymap('n', '<C-p>', ':Telescope find_files<CR>', { desc = 'Find files (Ctrl-P)' })

-- テキスト検索（曖昧検索）
keymap('n', '<leader>fg', ':Telescope live_grep<CR>', { desc = 'Find text (grep)' })
keymap('n', '<C-f>', ':Telescope live_grep<CR>', { desc = 'Find text (Ctrl-F)' })

-- バッファ検索
keymap('n', '<leader>fb', ':Telescope buffers<CR>', { desc = 'Find buffers' })
keymap('n', '<leader><leader>', ':Telescope buffers<CR>', { desc = 'Find buffers (quick)' })

-- 最近使ったファイル
keymap('n', '<leader>fr', ':Telescope oldfiles<CR>', { desc = 'Recent files' })

-- カレントファイル内検索
keymap('n', '<leader>/', ':Telescope current_buffer_fuzzy_find<CR>', { desc = 'Search in current file' })

-- コマンド履歴
keymap('n', '<leader>fh', ':Telescope command_history<CR>', { desc = 'Command history' })

-- ヘルプ検索
keymap('n', '<leader>fH', ':Telescope help_tags<CR>', { desc = 'Help tags' })

-- カラーテーマピッカー
keymap('n', '<leader>th', ':Telescope colorscheme<CR>', { desc = 'Theme picker' })

-- ================================================
-- LSP操作（すでに設定されているものを整理）
-- ================================================

-- 定義へジャンプ
-- keymap('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })

-- ホバー情報
-- keymap('n', 'K', vim.lsp.buf.hover, { desc = 'Hover' })

-- 参照一覧
-- keymap('n', 'gr', vim.lsp.buf.references, { desc = 'References' })

-- リネーム
-- keymap('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename' })

-- コードアクション
-- keymap('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code action' })

-- フォーマット
-- keymap('n', '<leader>f', vim.lsp.buf.format, { desc = 'Format' })

-- LSP関連のTelescope検索
keymap('n', '<leader>fs', ':Telescope lsp_document_symbols<CR>', { desc = 'Find symbols in file' })
keymap('n', '<leader>fS', ':Telescope lsp_workspace_symbols<CR>', { desc = 'Find symbols in workspace' })
keymap('n', '<leader>fd', ':Telescope diagnostics<CR>', { desc = 'Find diagnostics' })

-- ================================================
-- ウィンドウ操作
-- ================================================

-- ウィンドウ間移動
keymap('n', '<C-h>', '<C-w>h', { desc = 'Move to left window' })
keymap('n', '<C-j>', '<C-w>j', { desc = 'Move to bottom window' })
keymap('n', '<C-k>', '<C-w>k', { desc = 'Move to top window' })
keymap('n', '<C-l>', '<C-w>l', { desc = 'Move to right window' })

-- ウィンドウ分割
keymap('n', '<leader>sv', ':vsplit<CR>', { desc = 'Split vertically' })
keymap('n', '<leader>sh', ':split<CR>', { desc = 'Split horizontally' })
keymap('n', '<leader>sc', ':close<CR>', { desc = 'Close window' })

-- ウィンドウサイズ調整
keymap('n', '<C-Up>', ':resize +2<CR>', opts)
keymap('n', '<C-Down>', ':resize -2<CR>', opts)
keymap('n', '<C-Left>', ':vertical resize -2<CR>', opts)
keymap('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- ================================================
-- バッファ操作
-- ================================================

-- バッファ切り替え（タブで移動）
keymap('n', '<Tab>', ':BufferLineCycleNext<CR>', { desc = 'Next buffer' })
keymap('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', { desc = 'Previous buffer' })

-- バッファを閉じる
keymap('n', '<leader>bd', ':bdelete<CR>', { desc = 'Delete buffer' })
keymap('n', '<leader>ba', ':bufdo bd<CR>', { desc = 'Delete all buffers' })

-- ================================================
-- 編集操作
-- ================================================

-- インデント調整（ビジュアルモードで選択後も解除されない）
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- 行の移動
keymap('n', '<A-j>', ':m .+1<CR>==', { desc = 'Move line down' })
keymap('n', '<A-k>', ':m .-2<CR>==', { desc = 'Move line up' })
keymap('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
keymap('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

-- 行の複製
keymap('n', '<leader>d', ':t.<CR>', { desc = 'Duplicate line' })

-- ================================================
-- ターミナル操作（toggleterm.nvimで設定）
-- ================================================

-- toggleterm.luaで設定しているため、ここでは定義なし
-- 以下のキーマッピングが利用可能：
-- Ctrl-/ : フローティングターミナルをトグル
-- <leader>tf : フローティングターミナルをトグル
-- <leader>ts : 横分割ターミナルをトグル
-- <leader>tv : 縦分割ターミナルをトグル
-- <leader>gg : Lazygitをトグル（Lazygitがインストールされている場合）

-- ================================================
-- その他便利機能
-- ================================================

-- ハイライトを消す
keymap('n', '<leader>nh', ':noh<CR>', { desc = 'No highlight' })

-- ファイルツリー（Oil）
keymap('n', '<leader>e', ':Oil<CR>', { desc = 'Open file explorer' })

-- Git操作（gitsigns）
keymap('n', ']c', ':Gitsigns next_hunk<CR>', { desc = 'Next git hunk' })
keymap('n', '[c', ':Gitsigns prev_hunk<CR>', { desc = 'Previous git hunk' })
keymap('n', '<leader>gp', ':Gitsigns preview_hunk<CR>', { desc = 'Preview git hunk' })
keymap('n', '<leader>gb', ':Gitsigns toggle_current_line_blame<CR>', { desc = 'Toggle git blame' })
keymap('n', '<leader>gd', ':Gitsigns diffthis<CR>', { desc = 'Git diff' })
