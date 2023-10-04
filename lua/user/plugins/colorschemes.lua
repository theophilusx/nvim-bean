-- function ColorMyPencils(color)
-- 	color = color or "nightfly"
-- 	vim.cmd.colorscheme(color)
--
-- 	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- 	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- end

return {
	{
		"bluz71/vim-nightfly-colors",
		priority = 1000, -- make sure to load this before all the other start plugins
		-- config = function()
		-- 	-- load the colorscheme here
		-- 	vim.cmd([[colorscheme nightfly]])
		-- 	-- ColorMyPencils("nightfly")
		-- 	vim.g.nightflyTransparent = true
		-- 	vim.g.nightflyUnderlineMatchParen = true
		-- 	vim.g.nightflyVirtualTextColor = true
		-- 	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		-- end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"Abstract-IDE/Abstract-cs",
		lazy = false,
		priority = 1000,
	},
	{
		"Shatur/neovim-ayu",
		lazy = false,
		priority = 1000,
		config = function()
			require("ayu").colorscheme()
		end,
	},
	-- {
	--   "folke/tokyonight.nvim",
	--   priority = 1000, -- make sure to load this before all the other start plugins
	--   config = function()
	--     local bg = "#011628"
	--     local bg_dark = "#011423"
	--     local bg_highlight = "#143652"
	--     local bg_search = "#0A64AC"
	--     local bg_visual = "#275378"
	--     local fg = "#CBE0F0"
	--     local fg_dark = "#B4D0E9"
	--     local fg_gutter = "#627E97"
	--     local border = "#547998"
	--
	--     require("tokyonight").setup({
	--       style = "night",
	--       on_colors = function(colors)
	--         colors.bg = bg
	--         colors.bg_dark = bg_dark
	--         colors.bg_float = bg_dark
	--         colors.bg_highlight = bg_highlight
	--         colors.bg_popup = bg_dark
	--         colors.bg_search = bg_search
	--         colors.bg_sidebar = bg_dark
	--         colors.bg_statusline = bg_dark
	--         colors.bg_visual = bg_visual
	--         colors.border = border
	--         colors.fg = fg
	--         colors.fg_dark = fg_dark
	--         colors.fg_float = fg
	--         colors.fg_gutter = fg_gutter
	--         colors.fg_sidebar = fg_dark
	--       end,
	--     })
	--     -- load the colorscheme here
	--     vim.cmd([[colorscheme tokyonight]])
	--   end,
	-- },
}