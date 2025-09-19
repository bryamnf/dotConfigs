-- Leader key
vim.g.mapleader = " "

-- Relative number
vim.o.relativenumber = true

-- Clipboard
vim.api.nvim_set_option("clipboard", "unnamedplus")

-- Add parser directory to runtimepath
vim.opt.runtimepath:append(vim.fn.stdpath("data") .. "/parsers")

-- Enable built-in lua module caching
vim.loader.enable()


vim.opt.tabstop = 2 -- Number of spaces tabs count for
