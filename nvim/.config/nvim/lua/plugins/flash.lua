-- ================================================
-- Flash.nvim: 高速ジャンプ
-- ================================================
-- s: 検索してジャンプ
-- S: Treesitterでジャンプ（関数・ブロック単位）
-- r: リモートアクション（オペレーター待機中）
-- <c-s>: 検索中にトグル

return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
        labels = "asdfghjklqwertyuiopzxcvbnm",
        search = {
            multi_window = true,
            forward = true,
            wrap = true,
            mode = "search",  -- Neovimのignorecase/smartcase設定に従う
        },
        jump = {
            jumplist = true,
            pos = "start",
            autojump = false,
        },
        label = {
            uppercase = false,
            rainbow = {
                enabled = true,
                shade = 5,
            },
        },
        modes = {
            search = {
                enabled = false,  -- 通常の / 検索では無効
            },
            char = {
                enabled = true,
                jump_labels = true,
            },
            treesitter = {
                labels = "asdfghjklqwertyuiopzxcvbnm",
                jump = { pos = "range" },
                label = { before = true, after = true },
            },
        },
    },
    keys = {
        {
            "s",
            mode = { "n", "x", "o" },
            function() require("flash").jump() end,
            desc = "Flash jump",
        },
        {
            "S",
            mode = { "n", "x", "o" },
            function() require("flash").treesitter() end,
            desc = "Flash Treesitter",
        },
        {
            "r",
            mode = "o",
            function() require("flash").remote() end,
            desc = "Remote Flash",
        },
        {
            "R",
            mode = { "o", "x" },
            function() require("flash").treesitter_search() end,
            desc = "Treesitter Search",
        },
        {
            "<c-s>",
            mode = { "c" },
            function() require("flash").toggle() end,
            desc = "Toggle Flash Search",
        },
    },
}
