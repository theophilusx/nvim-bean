return {
	"Olical/conjure",
	ft = { "clojure", "fennel", "python" }, -- etc
	-- [Optional] cmp-conjure for cmp
	dependencies = {
		{
			"PaterJason/cmp-conjure",
			config = function()
				local cmp = require("cmp")
				local config = cmp.get_config()
				table.insert(config.sources, {
					name = "buffer",
					option = {
						sources = {
							{ name = "conjure" },
						},
					},
				})
				cmp.setup(config)
			end,
		},
	},
	config = function(_, _)
		require("conjure.main").main()
		require("conjure.mapping")["on-filetype"]()
		local wk = require("which-key")
		wk.register({
			c = {
				name = "Connect",
			},
			e = {
				name = "Eval",
			},
			l = {
				name = "Log",
			},
			g = {
				name = "Goto",
			},
			r = {
				name = "Refresh",
			},
			s = {
				name = "Session",
			},
			t = {
				name = "Test",
			},
			v = {
				name = "View",
			},
		}, {
			prefix = "<LocalLeader>",
			buffer = 0,
		})
	end,
	init = function()
		-- Set configuration options here
		-- vim.g["conjure#debug"] = true
		vim.g["conjure#mapping#prefix"] = "<LocalLeader>"
		-- vim.g["conjure#log#hud#width"] = 1
		-- vim.g["conjure#log#hud#enabled"] = false
		-- vim.g["conjure#log#hud#anchor"] = "SE"
		vim.g["conjure#log#botright"] = true
		-- vim.g["conjure#extract#context_header_lines"] = 100
		vim.g["conjure#eval#comment_prefix"] = ";; "
		vim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = false
		vim.g["conjure#client#clojure#nrepl#connection#auto_repl#hidden"] = true
		vim.g["conjure#client#clojure#nrepl#connection#auto_repl#cmd"] = nil
		vim.g["conjure#client#clojure#nrepl#eval#auto_require"] = false
		-- vim.g["conjure#client#clojure#nrepl#test#runner"] = "kaocha"

		vim.api.nvim_create_autocmd("BufNewFile", {
			group = vim.api.nvim_create_augroup("conjure_log_disable_lsp", { clear = true }),
			pattern = { "conjure-log-*" },
			callback = function()
				vim.diagnostic.disable(0)
			end,
			desc = "Conjure Log disable LSP diagnostics",
		})

		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("comment_config", { clear = true }),
			pattern = { "clojure" },
			callback = function()
				vim.bo.commentstring = ";; %s"
			end,
			desc = "Lisp style line comment",
		})
	end,
}
