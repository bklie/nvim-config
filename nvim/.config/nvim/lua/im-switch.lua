-- ================================================
-- 日本語入力自動切替
-- ================================================
-- Insertモードを抜けた時に自動で英語入力に切り替え
-- bullets.vim等が一瞬InsertLeaveを発生させる問題を回避するため、
-- ModeChangedイベントとdefer_fnを使用

local M = {}

function M.setup()
    local is_mac = vim.fn.has("macunix") == 1
    local is_linux = vim.fn.has("unix") == 1 and not is_mac

    if not is_mac and not is_linux then
        return
    end

    -- 英語入力に切り替える関数
    local function switch_to_english()
        if is_mac then
            vim.fn.jobstart({ "im-select", "com.apple.keylayout.ABC" }, { detach = true })
        elseif is_linux then
            vim.fn.jobstart({ "fcitx5-remote", "-c" }, { detach = true })
        end
    end

    -- ModeChangedイベントでInsert→Normalの切り替えを検出
    vim.api.nvim_create_autocmd("ModeChanged", {
        pattern = { "i:n", "i:no", "i:v", "i:V", "i:\22", "i:c" },
        callback = function()
            -- 少し待ってからモードを確認（プラグインによる一時的なモード変更を回避）
            vim.defer_fn(function()
                local mode = vim.api.nvim_get_mode().mode
                -- まだInsertモードでなければ切り替え
                if not mode:match("^i") then
                    switch_to_english()
                end
            end, 20)
        end,
    })

    -- FocusLost時も切り替え（ウィンドウ切替時）
    vim.api.nvim_create_autocmd("FocusLost", {
        callback = switch_to_english,
    })
end

return M
