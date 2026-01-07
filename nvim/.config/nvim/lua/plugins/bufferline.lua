return {
    {
        "akinsho/bufferline.nvim",
        dependencies = "nvim-web-devicons",
        config = function()
            -- メモの1行目を取得する関数
            local function get_memo_title(buf)
                local path = vim.api.nvim_buf_get_name(buf)
                local memo_path = vim.fn.expand("~/Memo/")

                -- Memoディレクトリのファイルかどうかをチェック
                if not path:find(memo_path, 1, true) then
                    return nil
                end

                -- バッファの1行目を取得
                local lines = vim.api.nvim_buf_get_lines(buf, 0, 1, false)
                if lines and lines[1] and lines[1] ~= "" then
                    local title = lines[1]
                    -- Markdownの見出し記号を除去
                    title = title:gsub("^#+%s*", "")
                    -- 長すぎる場合は切り詰め
                    if #title > 30 then
                        title = title:sub(1, 27) .. "..."
                    end
                    return title
                end

                return nil
            end

            require("bufferline").setup({
                options = {
                    mode = "buffers",
                    separator_style = "slant",
                    always_show_bufferline = true,
                    -- メモの場合は1行目を表示
                    name_formatter = function(buf)
                        local title = get_memo_title(buf.bufnr)
                        if title then
                            return title
                        end
                        return buf.name
                    end,
                    -- ターミナルバッファを除外
                    custom_filter = function(buf_number, _)
                        if vim.bo[buf_number].buftype == "terminal" then
                            return false
                        end
                        return true
                    end,
                    show_buffer_close_icons = true,  -- バツマーク表示
                    show_close_icon = false,
                    close_icon = '󰅖',
                    buffer_close_icon = '󰅖',
                    modified_icon = '●',
                    left_trunc_marker = '',
                    right_trunc_marker = '',
                    color_icons = true,
                    diagnostics = "nvim_lsp",
                    diagnostics_indicator = function(count, level)
                        local icon = level:match("error") and " " or " "
                        return " " .. icon .. count
                    end,
                    offsets = {
                        {
                            filetype = "NvimTree",
                            text = "File Explorer",
                            highlight = "Directory",
                            text_align = "left"
                        },
                        {
                            filetype = "oil",
                            text = "File Explorer",
                            highlight = "Directory",
                            text_align = "left"
                        }
                    },
                    -- マウスクリックでバッファを閉じる
                    close_command = "bdelete! %d",
                    right_mouse_command = "bdelete! %d",
                    left_mouse_command = "buffer %d",
                    middle_mouse_command = nil,
                },
            })

            -- キーマッピング
            vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
            vim.keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
            vim.keymap.set('n', '<leader>x', ':bdelete<CR>', { noremap = true, silent = true })
        end
    },
}
