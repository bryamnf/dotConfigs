-- Disable syntax highlighting globally using an autocmd, so that the only highlight is done by Treesitter
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.cmd("syntax off")
    end,
})
