require("toggleterm").setup()
----------------------------------------------------------------
-- Keymaps
--
-- Esc from terminal mode
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], {noremap = true})

---------Creating toggle for floating terminal with only one keymap---------
-- create a dedicated floating terminal
local Terminal = require("toggleterm.terminal").Terminal
local float_term = Terminal:new({
  direction = "float",
  close_on_exit = true,   -- auto-close when process exits
})

-- toggle function
function _FLOAT_TERM_TOGGLE()
  float_term:toggle()
end

-- keymap to toggle it
vim.keymap.set({"n", "t"}, "<leader>t", _FLOAT_TERM_TOGGLE, { noremap = true, silent = true })
------------------------------------------------------------------------------
