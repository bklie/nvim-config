return {
    -- im-select.nvim: インサートモード離脱時に自動で英語入力に切替
    {
        "keaising/im-select.nvim",
        event = "InsertEnter",
        config = function()
            require("im_select").setup({
                -- macOS: 英語入力ソース
                default_im_select = "com.apple.keylayout.ABC",
                default_command = "im-select",
                -- インサートモード離脱時に英語に切替
                set_default_events = { "InsertLeave", "CmdlineLeave" },
                -- インサートモード復帰時に前の入力ソースを復元しない（常に英語で開始）
                set_previous_events = {},
            })
        end,
    },

    -- Sidekick.nvim: AI assistant
    {
        "folke/sidekick.nvim",
        event = "VeryLazy",
        opts = {
            -- CLI設定
            cli = {
                -- デフォルトのAIエージェント（local.luaで上書き可能）
                -- vim.g.sidekick_default_cli を設定すると変更可能
                default = vim.g.sidekick_default_cli or "claude",
                win = {
                    -- 左側に表示
                    layout = "left",
                    split = {
                        width = 80,
                    },
                },
            },
            -- Next Edit Suggestions (Copilot LSP)
            nes = {
                enabled = true,
            },
        },
        keys = {
            -- <leader>a でトグル
            {
                "<leader>a",
                function()
                    local cli_name = vim.g.sidekick_default_cli or "claude"
                    require("sidekick.cli").toggle({ name = cli_name, focus = true })
                end,
                mode = { "n", "t" },
                desc = "Toggle Sidekick AI",
            },
            -- <leader>as でAIツールを選択
            {
                "<leader>as",
                function()
                    require("sidekick.cli").select()
                end,
                desc = "Select AI CLI",
            },
            -- <leader>af で現在のファイルをAIに送信
            {
                "<leader>af",
                function()
                    require("sidekick.cli").send({ msg = "{file}" })
                end,
                desc = "Send file to AI",
            },
            -- <leader>at で現在の選択/カーソル位置をAIに送信
            {
                "<leader>at",
                function()
                    require("sidekick.cli").send({ msg = "{this}" })
                end,
                mode = { "n", "v" },
                desc = "Send context to AI",
            },
        },
    },
}
