local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Beginnig of Plugins

Plug('ggandor/leap.nvim')
Plug('akinsho/toggleterm.nvim',{ ['tag'] = '*' })
-- End of Plugins
vim.call('plug#end')
