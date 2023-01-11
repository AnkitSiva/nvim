local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

vim.keymap.set("n", "<leader>a", mark.add_file, { desc = '[A]dd file to Harpoon list' })
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = '[<C-e>] Open harpoon menu' })
vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end, { desc = 'Open [1]st harpoon file' })
vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end, { desc = 'Open [2]st harpoon file' })
vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end, { desc = 'Open [3]st harpoon file' })
vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end, { desc = 'Open [4]st harpoon file' })
