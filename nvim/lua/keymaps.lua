local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Cursor movements
keymap("n", "<leader>l", "$", opts)           -- End of line
keymap("n", "<leader>h", "^", opts)           -- Beginning of line
keymap("n", "<leader>k", "gg", opts)          -- Top of file
keymap("n", "<leader>j", "G", opts)           -- Bottom of file
keymap("v", "<leader>l", "$", opts)           -- End of line
keymap("v", "<leader>h", "^", opts)           -- Beginning of line
keymap("v", "<leader>k", "gg", opts)          -- Top of file
keymap("v", "<leader>j", "G", opts)           -- Bottom of file

-- Clipboard
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set({'n','v'}, '<leader>p', '"+p')
