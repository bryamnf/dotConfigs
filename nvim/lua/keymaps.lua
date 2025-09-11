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
keymap('v', '<leader>y', '"+y')
keymap({'n','v'}, '<leader>p', '"+p',opts)

-- Explore
keymap({'n','v'}, 'q',':Ex<CR>',opts)

-- Esc from terminal mode
keymap('t', '<Esc>', [[<C-\><C-n>]], opts)
-- Move between windows in terminal mode
keymap('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
keymap('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
keymap('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
keymap('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
-- Keep ctrl w functionality in terminal mode
keymap('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
