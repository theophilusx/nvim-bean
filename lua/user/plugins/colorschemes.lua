return {
	-- {
	-- 	"bluz71/vim-nightfly-colors",
	-- 	name = "nightfly",
	-- 	--lazy = false,
	-- 	--priority = 1000, -- make sure to load this before all the other start plugins
	-- 	config = function()
	-- 		-- 	-- load the colorscheme here
	-- 		-- vim.cmd([[colorscheme nightfly]])
	--
	-- 		vim.g.nightflyTransparent = false
	-- 		vim.g.nightflyUnderlineMatchParen = true
	-- 		vim.g.nightflyVirtualTextColor = true
	-- 		vim.api.nvim_set_hl(0, "MatchParen", { bg = "#AA0011", fg = "#FFFF00" })
	-- 		-- vim.api.nvim_set_hl(0, { name = "NightflyVisual" }, { bg = "#0000FF" })
	--
	-- 		-- local highlight = vim.api.nvim_set_hl
	-- 		-- local custom_highlight = vim.api.nvim_create_augroup("CustomHighlight", {})
	-- 		-- vim.api.nvim_create_autocmd("ColorScheme", {
	-- 		-- 	pattern = "nightfly",
	-- 		-- 	callback = function()
	-- 		-- 		highlight(0, "NightflyVisual", { fg = "#FFFFFF", bg = "#FF5555" })
	-- 		-- 		highlight(0, { name = "MatchParen" }, { fg = "#FFAF00", bg = "#AA0000" })
	-- 		-- 	end,
	-- 		-- 	group = custom_highlight,
	-- 		-- })
	-- 	end,
	-- },
	{
		"bluz71/vim-moonfly-colors",
		name = "moonfly",
		lazy = false,
		-- priority = 1000,
		-- config = function()
		-- 	vim.api.nvim_set_hl(0, "MatchParen", { bg = "#AA0011", fg = "#FFFF00" })
		-- 	vim.cmd([[colorscheme moonfly]])
		-- end,
	},
	{
		"nyoom-engineering/oxocarbon.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.opt.background = "dark"
			vim.cmd.colorscheme("oxocarbon")
			vim.api.nvim_set_hl(0, "MatchParen", { bg = "#AA0011", fg = "#FFFF00" })
		end,
	},
	-- {
	-- 	"marko-cerovac/material.nvim",
	-- 	-- lazy = false,
	-- 	-- priority = 1000,
	-- 	options = {
	-- 		material_style = "deep ocean",
	-- 	},
	-- 	config = function()
	-- 		vim.api.nvim_set_hl(0, "MatchParen", { bg = "#AA0011", fg = "#FFFF00" })
	-- 	end,
	-- },
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	-- lazy = false,
	-- 	-- priority = 1000,
	-- 	opts = {},
	-- },
	-- {
	-- 	"Abstract-IDE/Abstract-cs",
	-- 	-- lazy = false,
	-- 	-- priority = 1000,
	-- },
	-- {
	-- 	"Shatur/neovim-ayu",
	-- 	-- lazy = false,
	-- 	-- priority = 1000,
	-- 	-- config = function()
	-- 	-- 	require("ayu").colorscheme()
	-- 	-- end,
	-- },
}
