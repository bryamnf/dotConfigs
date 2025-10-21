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
				["l="] = "@assignment.lhs",
				["r="] = "@assignment.rhs",

				-- Comments
				["a/"] = "@comment.outer",
				["i/"] = "@comment.inner",

				-- Conditionals
				["ac"] = "@conditional.outer",
				["ic"] = "@conditional.inner",

				-- Loops
				["al"] = "@loop.outer",
				["il"] = "@loop.inner",

				-- Returns
				["ar"] = "@return.outer",
				["ir"] = "@return.inner",

				-- Numbers
				["an"] = "@number.inner",

				-- Calls (x = execute)
				["ae"] = "@call.outer",
				["ie"] = "@call.inner",

				-- Classes
				["acl"] = "@class.outer",
				["icl"] = "@class.inner",

				-- Blocks
				["ab"] = "@block.outer",
				["ib"] = "@block.inner",

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
vim.keymap.set({ "n", "x", "o" }, "L", ts_repeat_move.repeat_last_move_next)
vim.keymap.set({ "n", "x", "o" }, "H", ts_repeat_move.repeat_last_move_previous)
