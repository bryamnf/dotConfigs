-- Toggle spell check on/off
vim.keymap.set("n", '<C-s>c', function()
	vim.opt.spell = not vim.opt.spell:get()
	if vim.opt.spell:get() then
		print("Spell check: ON (" .. vim.o.spelllang .. ")")
	else
		print("Spell check: OFF")
	end
end, { desc = "Toggle spell checking" })

-- Cycle through languages
local languages = { "en_us", "es", "de" }
local lang_index = 1

vim.keymap.set("n", '<C-s>l', function()
	lang_index = lang_index % #languages + 1
	vim.opt.spelllang = languages[lang_index]
	print("Spell language: " .. languages[lang_index])
end, { desc = "Cycle spell languages" })
