local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    -- Conform will run multiple formatters sequentially
    python = { "ruff", lsp_format = "fallback", stop_after_first = true },
  },
  format_on_save = {
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  },
})

vim.keymap.set({ "n", "v" }, "<leader>ff", function()
  conform.format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  })
end, { desc = "Format file" })
