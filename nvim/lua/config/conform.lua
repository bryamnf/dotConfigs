local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    -- Conform will run multiple formatters sequentially
    python = { "ruf", lsp_format = "fallback", stop_after_first = true },
  },
  format_on_save = {
    lsp_fallback = true,
    timeout_ms = 2000,
  },
})

vim.keymap.set({ "n", "v" }, "<leader>f", function()
  conform.format({
    lsp_fallback = true,
    async = true,
  })
end, { desc = "Format file" })
