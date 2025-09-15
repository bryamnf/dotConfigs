require'nvim-treesitter.configs'.setup {
  textobjects = {

    -- Selection
    select = {
      enable = true,
      lookahead = true, -- auto-jump forward to textobj like targets.vim
      keymaps = {
        -- Functions
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",

        -- Classes
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",

        -- Blocks
        ["ab"] = "@block.outer",
        ["ib"] = "@block.inner",

        -- Conditionals (d = decision)
        ["ad"] = "@conditional.outer",
        ["id"] = "@conditional.inner",

        -- Loops
        ["al"] = "@loop.outer",
        ["il"] = "@loop.inner",

        -- Parameters (a = argument)
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",

        -- Assignments
        ["a="] = "@assignment.outer",
        ["i="] = "@assignment.inner",
        ["l="] = "@assignment.lhs",
        ["r="] = "@assignment.rhs",

        -- Calls (x = execute)
        ["ax"] = "@call.outer",
        ["ix"] = "@call.inner",

        -- Returns
        ["ar"] = "@return.outer",
        ["ir"] = "@return.inner",

        -- Comments
        ["a/"] = "@comment.outer",
        ["i/"] = "@comment.inner",

        -- Numbers
        ["an"] = "@number.inner",

        -- Statements
        ["as"] = "@statement.outer",

        -- Scopename (like identifier in decls)
        ["is"] = "@scopename.inner",
      },
    },

    -- Movement
    move = {
      enable = true,
      set_jumps = true,

      goto_next_start = {
        ["]f"] = "@function.outer",
        ["]c"] = "@class.outer",
        ["]b"] = "@block.outer",
        ["]d"] = "@conditional.outer", -- decision
        ["]l"] = "@loop.outer",
        ["]a"] = "@parameter.inner",
        ["]="] = "@assignment.outer",
        ["]x"] = "@call.outer",        -- execute
        ["]r"] = "@return.outer",
        ["]/"] = "@comment.outer",
        ["]n"] = "@number.inner",
        ["]s"] = "@statement.inner",
      },

      goto_next_end = {
        ["]F"] = "@function.outer",
        ["]C"] = "@class.outer",
        ["]B"] = "@block.outer",
        ["]D"] = "@conditional.outer",
        ["]L"] = "@loop.outer",
        ["]A"] = "@parameter.inner",
        ["]+"] = "@assignment.outer",
        ["]X"] = "@call.outer",
        ["]R"] = "@return.outer",
        ["]?"] = "@comment.outer",
        ["]N"] = "@number.inner",
        ["]S"] = "@statement.outer",
      },

      goto_previous_start = {
        ["[f"] = "@function.outer",
        ["[c"] = "@class.outer",
        ["[b"] = "@block.outer",
        ["[d"] = "@conditional.outer",
        ["[l"] = "@loop.outer",
        ["[a"] = "@parameter.inner",
        ["[="] = "@assignment.outer",
        ["[x"] = "@call.outer",
        ["[r"] = "@return.outer",
        ["[/"] = "@comment.outer",
        ["[n"] = "@number.inner",
        ["[s"] = "@statement.outer",
      },

      goto_previous_end = {
        ["[F"] = "@function.outer",
        ["[C"] = "@class.outer",
        ["[B"] = "@block.outer",
        ["[D"] = "@conditional.outer",
        ["[L"] = "@loop.outer",
        ["[A"] = "@parameter.inner",
        ["[+"] = "@assignment.outer",
        ["[X"] = "@call.outer",
        ["[R"] = "@return.outer",
        ["[?"] = "@comment.outer",
        ["[N"] = "@number.inner",
        ["[S"] = "@statement.outer",
      },
    },
  },
}
-- Repeatable movements with ; and ,
local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"

-- Always forward with ; and backward with ,
vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_next)
vim.keymap.set({ "n", "x", "o" }, "<", ts_repeat_move.repeat_last_move_previous)

-- Optionally: make f/F/t/T also repeatable with ; and ,
vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
