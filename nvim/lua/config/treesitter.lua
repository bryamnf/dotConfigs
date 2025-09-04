require('nvim-treesitter.configs').setup {
  ensure_installed = {
    -- Core / editor stuff
    "lua", "vim", "vimdoc", "bash", "regex", "json", "yaml", "toml",

    -- Web stack
    "html", "css", "javascript", "typescript", "tsx",

    -- General-purpose languages
    "python", "c", "cpp", "java", "go", "rust",

    -- Data / docs
    "markdown", "markdown_inline", "sql", "csv", "xml",
  },

  sync_install = false,
  auto_install = true, -- grab others on demand

  parser_install_dir = vim.fn.stdpath("data") .. "/parsers",

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

