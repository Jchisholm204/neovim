vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover)
-- Jump to definition
vim.keymap.set("n", "gd", vim.lsp.buf.definition)

-- use spaces instead of tabs
vim.o.expandtab = true
-- set the number of spaces used per tab
vim.o.tabstop = 4
vim.o.shiftwidth = 4
