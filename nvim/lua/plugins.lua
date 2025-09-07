local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Beginnig of Plugins

Plug('akinsho/toggleterm.nvim',{ ['tag'] = '*' })
Plug('ggandor/leap.nvim')
Plug("nvim-treesitter/nvim-treesitter", {branch = 'master', lazy = false, build = ":TSUpdate"})
Plug('catppuccin/nvim', {as = 'cappuccin'})

-- End of Plugins
vim.call('plug#end')
