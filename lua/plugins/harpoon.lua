local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader>r", mark.toggle_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
vim.keymap.set("n", "<leader>clr", mark.clear_all)

vim.keymap.set("n", "<leader>p1", function() ui.nav_file(1) end) 
vim.keymap.set("n", "<leader>p2", function() ui.nav_file(2) end) 
vim.keymap.set("n", "<leader>p3", function() ui.nav_file(3) end) 
vim.keymap.set("n", "<leader>p4", function() ui.nav_file(4) end) 

