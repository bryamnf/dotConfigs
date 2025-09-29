-- Leader key
vim.g.mapleader = " "

-- Relative number
vim.o.relativenumber = true

-- Clipboard
vim.api.nvim_set_option("clipboard", "unnamedplus")

-- Add parser directory to runtimepath
vim.opt.runtimepath:append(vim.fn.stdpath("data") .. "/parsers")

-- Add spell directory for spellcheck files
vim.opt.runtimepath:append(vim.fn.stdpath("data") .. "/spell")

-- Enable built-in lua module caching
vim.loader.enable()

-- Number of spaces tabs count for
vim.opt.tabstop = 2
