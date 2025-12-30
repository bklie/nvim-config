return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
        },
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            -- LSP起動時の共通設定
            local on_attach = function(client, bufnr)
                -- キーマッピング
                local opts = { noremap = true, silent = true, buffer = bufnr }

                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
                vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
                vim.keymap.set('n', '<space>f', function()
                    vim.lsp.buf.format({ async = true })
                end, opts)
            end

            -- LSP共通設定
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            -- lspconfigを取得
            local lspconfig = require('lspconfig')

            -- 各言語のLSP設定（追加しやすい構造）
            local servers = {
                -- Lua
                lua_ls = {
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { 'vim' }
                            },
                            workspace = {
                                library = vim.api.nvim_get_runtime_file("", true),
                                checkThirdParty = false,
                            },
                            telemetry = {
                                enable = false,
                            },
                        }
                    }
                },
                -- JavaScript/TypeScript
                ts_ls = {},
                -- Markdown
                marksman = {},
            }

            -- 各LSPサーバーをセットアップ
            for server, config in pairs(servers) do
                config.on_attach = on_attach
                config.capabilities = capabilities
                lspconfig[server].setup(config)
            end
        end
    },
}
