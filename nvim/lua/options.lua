-- Leader key
vim.g.mapleader = " "

-- Relative number
vim.o.relativenumber = true
vim.o.number = true

-- Clipboard
vim.api.nvim_set_option("clipboard", "unnamedplus")

-- Add parser directory to runtimepath
vim.opt.runtimepath:append(vim.fn.stdpath("data") .. "/parsers")

-- Enable built-in lua module caching
vim.loader.enable()


-- Set tab and indentation to 2 spaces
vim.opt.tabstop = 2        -- Number of visual spaces per TAB
vim.opt.softtabstop = 2    -- Number of spaces in tab when editing
vim.opt.shiftwidth = 2     -- Number of spaces for each indentation
vim.opt.expandtab = true   -- Use spaces instead of tabs
vim.opt.smartindent = true -- Autoindent new lines
vim.opt.autoindent = true  -- Copy indent from current line when starting a new one
