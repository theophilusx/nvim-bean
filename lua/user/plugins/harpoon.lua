return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		-- set keymaps
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<Leader>ha", mark.add_file, { desc = "Harpoon add" })
		keymap.set("n", "<Leader>hn", ui.nav_next, { desc = "Harpoon next" })
		keymap.set("n", "<Leader>hp", ui.nav_prev, { desc = "Harpoon prev" })
		keymap.set("n", "<Leader>hm", ui.toggle_quick_menu, { desc = "Harpoon menu" })
		keymap.set("n", "<Leader>1", function()
			ui.nav_file(1)
		end, { desc = "Harppon 1" })
		keymap.set("n", "<Leader>2", function()
			ui.nav_file(2)
		end, { desc = "Harpoon 2" })
		keymap.set("n", "<Leader>3", function()
			ui.nav_file(3)
		end, { desc = "Harpoon 3" })
		keymap.set("n", "<Leader>4", function()
			ui.nav_file(4)
		end, { desc = "Harpoon 4" })
	end,
}
