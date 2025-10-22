require 'nvim-treesitter.configs'.setup {
  textobjects = {

    -- Selection
    select = {
      enable = true,
      lookahead = true, -- auto-jump forward to textobj like targets.vim
      keymaps = {
        -- Functions
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",

        -- Parameters
        ["ax"] = "@parameter.outer",
        ["ix"] = "@parameter.inner",

        -- Assignments
        ["a="] = "@assignment.outer",
        ["i="] = "@assignment.inner",
        ["as"] = "@assignment.lhs",
        ["is"] = "@assignment.rhs",
      },
    },

    -- Movement
    move = {
      enable = true,
      set_jumps = true,

      goto_next_start = {
        ["[f"] = "@function.outer",
        ["[x"] = "@parameter.inner",
        ["[a"] = "@assignment.outer",
        ["]s"] = "@assignment.rhs",
      },

      goto_next_end = {
        ["]f"] = "@function.outer",
        ["]x"] = "@parameter.outer",
        ["]a"] = "@assignment.outer",
        ["[s"] = "@assignment.lhs",
      },

      goto_previous_start = {
        ["<f"] = "@function.outer",
        ["<x"] = "@parameter.inner",
        ["<a"] = "@assignment.outer",
        [">s"] = "@assignment.rhs",
      },

      goto_previous_end = {
        [">f"] = "@function.outer",
        [">x"] = "@parameter.outer",
        [">a"] = "@assignment.outer",
        ["<s"] = "@assignment.lhs",
      },
    },
  },
}
-- Repeatable movements with ; and ,
local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"

-- Always forward with > and backward with <
vim.keymap.set({ "n" }, "L", ts_repeat_move.repeat_last_move_next)
vim.keymap.set({ "n" }, "H", ts_repeat_move.repeat_last_move_previous)
