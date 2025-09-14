local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Beginning of Plugins

Plug('Mofiqul/vscode.nvim', { ['as'] = 'vscode' })
Plug('ggandor/leap.nvim')
Plug('akinsho/toggleterm.nvim',{ ['tag'] = '*' })
Plug("nvim-treesitter/nvim-treesitter", { ['do'] = ":TSUpdate" })
Plug("nvim-treesitter/nvim-treesitter-context")
Plug("nvim-treesitter/nvim-treesitter-textobjects")

-- End of Plugins
vim.call('plug#end')
