require("mason-lspconfig").setup { automatic_enable = true }

-------------------------------------------------------------
-- Basedpyright
vim.lsp.enable('basedpyright')
-------------------------------------------------------------

-------------------------------------------------------------
-- ofset for linters and formates in utf-8
vim.lsp.config('ruff', {
  capabilities = {
      general = {
        -- positionEncodings = { "utf-8", "utf-16", "utf-32" }  <--- this is the default
        positionEncodings = { "utf-16" }
      },
    }
})
-------------------------------------------------------------
