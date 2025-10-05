local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }


-- Cursor movements
keymap({ 'n', 'v', 'o' }, "<leader>l", "$", opts)  -- End of line
keymap({ 'n', 'v', 'o' }, "<leader>h", "^", opts)  -- Beginning of line
keymap({ 'n', 'v', 'o' }, "<leader>k", "gg", opts) -- Top of file
keymap({ 'n', 'v', 'o' }, "<leader>j", "G", opts)  -- Bottom of file

-- Windows
keymap({ 'n', 'v', 't' }, '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
keymap({ 'n', 'v', 't' }, '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
keymap({ 'n', 'v', 't' }, '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
keymap({ 'n', 'v', 't' }, '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
keymap({ 'n', 'v', 't' }, '<C-s>h', [[<Cmd>wincmd s<CR>]], opts)
keymap({ 'n', 'v', 't' }, '<C-s>v', [[<Cmd>wincmd v<CR>]], opts)
keymap({ 'n', 'v', 't' }, '<C-o>', [[<Cmd>wincmd o<CR>]], opts)
keymap({ 'n', 'v' }, '<C-q>', [[<Cmd>wincmd q<CR>]], opts)

-- Esc from terminal mode
keymap('t', '<C-q>', [[<C-\><C-n>]], opts)

-- Adding new lines
keymap("n", "<leader>o", ":call append(line('.'), '')<CR>", opts)
keymap("n", "<leader>O", ":call append(line('.')-1, '')<CR>", opts)

-- Save file
keymap({ "i", "v", "n" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })


-- Clipboard
keymap('v', '<leader>y', '"+y')
keymap({ 'n', 'v' }, '<leader>p', '"+p', opts)

-- Explore
keymap({ 'n', 'v' }, 'q', ':Ex<CR>', opts)


-- Resize window using <ctrl> arrow keys
keymap("n", "<C-Up>", "<cmd>resize +1<cr>", { desc = "Increase Window Height" })
keymap("n", "<C-Down>", "<cmd>resize -1<cr>", { desc = "Decrease Window Height" })
keymap("n", "<C-Left>", "<cmd>vertical resize -1<cr>", { desc = "Decrease Window Width" })
keymap("n", "<C-Right>", "<cmd>vertical resize +1<cr>", { desc = "Increase Window Width" })

-- better up/down
keymap({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
keymap({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
keymap({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
keymap({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Esc highlight mode
vim.keymap.set({ 'i', 'n', 'v' }, '<Esc>', function()
  vim.cmd('nohlsearch')
  return '<Esc>'
end, { expr = true, desc = 'Escape and clear search highlight' })


-- Go back
keymap("n", "gb", "<C-o>", opts)
-- Go forward
keymap("n", "gf", "<C-i>", opts)
