local map = vim.keymap.set

-- relative numbers in netrw
vim.api.nvim_create_autocmd("FileType", {
	pattern = "netrw",
	callback = function()
		vim.opt_local.relativenumber = true
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "netrw",
	callback = function()
		local opts = { noremap = true, silent = true, buffer = true }
		map({ 'n', 'v' }, "<leader>l", "$", opts)
		map({ 'n', 'v' }, "<leader>h", "^", opts)
		map({ 'n', 'v' }, "<leader>k", "gg", opts)
		map({ 'n', 'v' }, "<leader>j", "G", opts)
		map('n', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
		map('n', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
		map('n', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
		map('n', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
		map('n', '<C-\\>', [[<Cmd>wincmd s<CR>]], opts)
		map('n', '<C-s>', [[<Cmd>wincmd v<CR>]], opts)
		map('n', '<C-o>', [[<Cmd>wincmd o<CR>]], opts)
		map('n', '<C-q>', [[<Cmd>wincmd q<CR>]], opts)
	end,
})
