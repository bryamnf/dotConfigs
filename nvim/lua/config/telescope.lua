local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>tf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>tg', builtin.git_files, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>tw', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
