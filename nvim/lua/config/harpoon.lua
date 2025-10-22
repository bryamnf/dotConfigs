local harpoon = require("harpoon")
local harpoon_extensions = require("harpoon.extensions")



-- REQUIRED
harpoon:setup()
-- REQUIRED
harpoon:extend(harpoon_extensions.builtins.highlight_current_file())

vim.keymap.set("n", "<A-a>", function() harpoon:list():add() end)
vim.keymap.set("n", "<A-i>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<A-q>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<A-w>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<A-e>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<A-r>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<A-d>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<A-f>", function() harpoon:list():next() end)
