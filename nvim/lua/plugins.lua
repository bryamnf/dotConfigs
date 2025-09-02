local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Beginnig of Plugins

Plug('akinsho/toggleterm.nvim',{ ['tag'] = '*' })
Plug('ggandor/leap.nvim')

-- End of Plugins
vim.call('plug#end')
