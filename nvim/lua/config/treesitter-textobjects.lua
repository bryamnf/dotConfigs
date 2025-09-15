require'nvim-treesitter.configs'.setup {
  textobjects = {

    select = {
      enable = true,
      lookahead = false, -- like targets.vim
      keymaps = {
	-- Functions
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",

        -- Classes
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",

        -- Blocks (e.g. do...end, { ... })
        ["ab"] = "@block.outer",
        ["ib"] = "@block.inner",

        -- Conditionals (if, unless, etc.)
        ["a?"] = "@conditional.outer",
        ["i?"] = "@conditional.inner",

        -- Loops
        ["al"] = "@loop.outer",
        ["il"] = "@loop.inner",

        -- Parameters
        ["ap"] = "@parameter.outer",
        ["ip"] = "@parameter.inner",

        -- Assignments
        ["a="] = "@assignment.outer",
        ["i="] = "@assignment.inner",
        ["l="] = "@assignment.lhs",
        ["r="] = "@assignment.rhs",

        -- Calls
        ["afc"] = "@call.outer",
        ["ifc"] = "@call.inner",

        -- Returns
        ["ar"] = "@return.outer",
        ["ir"] = "@return.inner",

        -- Comments
        ["a/"] = "@comment.outer",
        ["i/"] = "@comment.inner",

        -- Numbers (useful in math-heavy code)
        ["an"] = "@number.inner",

        -- Statements
        ["as"] = "@statement.outer",

        -- Scopename (like variable or function name in declaration)
        ["is"] = "@scopename.inner",
	},
    },

    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
    },

    --swap = {
    --  enable = true,
    --  swap_next = {
    --    ["<leader>a"] = "@parameter.inner",
    --  },
    --  swap_previous = {
    --    ["<leader>A"] = "@parameter.inner",
    --  },
    --},

  },
}
