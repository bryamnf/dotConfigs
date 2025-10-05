-- =========================
-- Neovim LSP Configuration
-- =========================

local M = {}

-- =========================
-- Capabilities
-- =========================
M.capabilities = vim.lsp.protocol.make_client_capabilities()

-- =========================
-- On Attach Callback
-- =========================
M.on_attach = function(client, bufnr)
  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- Navigation
  keymap("n", "gd", vim.lsp.buf.definition, opts)
  keymap("n", "gD", vim.lsp.buf.declaration, opts)
  keymap("n", "gr", vim.lsp.buf.references, opts)
  keymap("n", "gi", vim.lsp.buf.implementation, opts)
  keymap("n", "gt", vim.lsp.buf.type_definition, opts)

  -- Info
  keymap("n", "K", vim.lsp.buf.hover, opts)
  keymap("n", "<C-k>", vim.lsp.buf.signature_help, opts)

  -- Code Actions / Refactor
  keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)

  -- Formatting
  keymap("n", "<leader>f", function()
    vim.lsp.buf.format({ async = true })
  end, opts)

  -- Autoformat on save
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
    })
  end

  -- Diagnostics
  keymap("n", "gl", vim.diagnostic.open_float, opts)
  keymap("n", "[d", vim.diagnostic.goto_prev, opts)
  keymap("n", "]d", vim.diagnostic.goto_next, opts)

  -- Show diagnostics in float on hover
  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
      vim.diagnostic.open_float(nil, { focusable = false })
    end,
  })

  -- Inlay Hints
  if client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  end

  -- Misc
  vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
  vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
end

---- =========================
---- Diagnostics UI
---- =========================
--vim.diagnostic.config({
--  virtual_text = { spacing = 4, prefix = "●" },
--  signs = true,
--  underline = true,
--  update_in_insert = false,
--  severity_sort = true,
--})
--
---- Diagnostic Signs
--local signs = {
--  Error = " ",
--  Warn  = " ",
--  Hint  = " ",
--  Info  = " ",
--}
--for type, icon in pairs(signs) do
--  local hl = "DiagnosticSign" .. type
--  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
--end

-- =========================
-- Autocommand: Attach Automatically
-- =========================
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and bufnr then
      M.on_attach(client, bufnr)
    end
  end,
})
