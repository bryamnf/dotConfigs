local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Beginning of Plugins

Plug('akinsho/toggleterm.nvim',{ ['tag'] = '*' })
Plug('ggandor/leap.nvim')
Plug("nvim-treesitter/nvim-treesitter", { ['do'] = ":TSUpdate" })
Plug('Mofiqul/vscode.nvim', { ['as'] = 'vscode' })

-- End of Plugins
vim.call('plug#end')
