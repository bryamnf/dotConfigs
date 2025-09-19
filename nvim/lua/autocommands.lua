local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

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
    local bufopts = { noremap = true, silent = true, buffer = true }
    keymap({'n','v'}, "<leader>l", "$", opts)
    keymap({'n','v'}, "<leader>h", "^", opts)
    keymap({'n','v'}, "<leader>k", "gg", opts)
    keymap({'n','v'}, "<leader>j", "G", opts)
    keymap('n', '<C-h>', [[<Cmd>wincmd h<CR>]], bufopts)
    keymap('n', '<C-j>', [[<Cmd>wincmd j<CR>]], bufopts)
    keymap('n', '<C-k>', [[<Cmd>wincmd k<CR>]], bufopts)
    keymap('n', '<C-l>', [[<Cmd>wincmd l<CR>]], bufopts)
    keymap('n', '<C-\\>', [[<Cmd>wincmd s<CR>]], bufopts)
    keymap('n', '<C-s>', [[<Cmd>wincmd v<CR>]], bufopts)
    keymap('n', '<C-o>', [[<Cmd>wincmd o<CR>]], bufopts)
    keymap('n', '<C-q>', [[<Cmd>wincmd q<CR>]], bufopts)
  end,
})
