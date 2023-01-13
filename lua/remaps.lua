vim.g.mapleader = " "
vim.keymap.set("n", "<leader>fe", vim.cmd.Ex, { desc = 'Open [F]ile [E]xplorer' })
vim.keymap.set('i', 'jj', '<Esc>', { desc = '[jj] Esc in insert mode' })
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = '[<Esc>] Escape in terminal mode' })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = '[J] Move code up in visual mode, respects indentation' })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = '[K] Move code down in visual mode, respects indentation' })

vim.keymap.set("n", "J", "mzJ`z", { desc = '[J] Append following line to this one in normal mode' })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = '[<C-d>] Scroll halfway down the screen' })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = '[<C-u>] Scroll halfway up the screen' })
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]],
    { desc = '[ p] Replace from clipboard and keep the contents of clipboard the same for repeated pastes' })

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = '[ y] Copy to system clipboard' })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = '[ Y] Copy line to system clipboard' })

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = '[ d] Delete and keep contents of clipboard' })

vim.keymap.set("n", "Q", "<nop>", { desc = '[Q] noop' })

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = '[ k] Go to next location in list' })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = '[ j] Go to previous location in list' })

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = 'Some find and replace magic' })
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>",
    { silent = true, desc = '[ x] Set this file to be executable by running `chmod +x`' })
