return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = 'master',
        lazy = false,
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                -- 自動インストールする言語
                ensure_installed = {
                    "lua",
                    "javascript",
                    "typescript",
                    "markdown",
                    "markdown_inline",  -- Markdownのインライン要素
                    "vim",
                    "vimdoc",
                },
                -- 自動インストールを有効化
                auto_install = true,
                -- シンタックスハイライトを有効化
                highlight = {
                    enable = true,
                    -- 追加の設定
                    additional_vim_regex_highlighting = false,
                },
                -- インデントを有効化
                indent = {
                    enable = true,
                },
            })
        end
    },
}
    
