-- ================================================
-- nvim-web-devicons: ファイルアイコン
-- ================================================
-- カスタムアイコンの追加（Blade等）

return {
    "nvim-tree/nvim-web-devicons",
    lazy = false,
    config = function()
        require("nvim-web-devicons").setup({
            override_by_extension = {
                ["blade.php"] = {
                    icon = "󰫐",
                    color = "#f9322c",
                    name = "Blade",
                },
            },
            override_by_filename = {
                [".env"] = {
                    icon = "",
                    color = "#faf743",
                    name = "Env",
                },
                [".env.local"] = {
                    icon = "",
                    color = "#faf743",
                    name = "EnvLocal",
                },
                [".env.example"] = {
                    icon = "",
                    color = "#faf743",
                    name = "EnvExample",
                },
            },
        })
    end,
}
