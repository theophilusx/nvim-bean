return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "truncate " },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
		})

		telescope.load_extension("fzf")

		-- set keymaps
		local builtin = require("telescope.builtin")
		local keymap = vim.keymap

		keymap.set("n", "<Leader>fb", builtin.buffers, { desc = "Buffer find" })
		keymap.set("n", "<Leader>ff", builtin.find_files, { desc = "Find files" })
		keymap.set("n", "<Leader>fg", builtin.git_files, { desc = "Git Files" })
		keymap.set("n", "<Leader>fr", builtin.oldfiles, { desc = "Recent files" })
		keymap.set("n", "<Leader>fs", builtin.live_grep, { desc = "Find string in cwd" })
		keymap.set("n", "<Leader>fc", builtin.grep_string, { desc = "Find string under cursor in cwd" })
	end,
}
