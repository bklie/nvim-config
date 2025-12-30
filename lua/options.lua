vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.clipboard:append({"unnamedplus"})
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent = true })
