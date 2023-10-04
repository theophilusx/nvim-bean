return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap -- for conciseness

		local opts = { noremap = true, silent = true }
		local gopts = { noremap = true, silent = true, buffer = nil }
		local on_attach = function(_, bufnr)
			opts.buffer = bufnr

			-- see available code actions, in visual mode will apply to selection
			opts.desc = "Code actions"
			keymap.set({ "n", "v" }, "<Leader>la", vim.lsp.buf.code_action, opts)

			-- show lsp definitions
			opts.desc = "Show LSP definitions"
			keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
			gopts.desc = "Show definitions"
			keymap.set("n", "<Leader>ld", "<cmd>Telescope lsp_definitions<CR>", gopts)

			-- go to declaration
			opts.desc = "Go to declaration"
			keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
			gopts.desc = "Go to declaration"
			keymap.set("n", "<Leader>lD", vim.lsp.buf.declaration, gopts)

			-- show  diagnostics for file
			opts.desc = "Buffer diagnostics"
			keymap.set("n", "<Leader>lf", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

			-- show lsp implementations
			opts.desc = "Show LSP implementations"
			keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
			gopts.desc = "Show implementations"
			keymap.set("n", "<Leader>li", "<cmd>Telescope lsp_implementations<CR>", opts)

			-- show documentation for what is under cursor
			opts.desc = "Show documentation for what is under cursor"
			keymap.set("n", "K", vim.lsp.buf.hover, opts)
			gopts.desc = "Symbol documentation"
			keymap.set("n", "<Leader>lK", vim.lsp.buf.hover, gopts)

			-- show diagnostics for line
			opts.desc = "Show line diagnostics"
			keymap.set("n", "<Leader>ll", vim.diagnostic.open_float, opts)

			-- jump to next diagnostic in buffer
			opts.desc = "Go to next diagnostic"
			keymap.set("n", "<Leader>ln", vim.diagnostic.goto_next, opts)

			-- jump to previous diagnostic in buffer
			opts.desc = "Go to previous diagnostic"
			keymap.set("n", "<Leader>lp", vim.diagnostic.goto_prev, opts)

			-- smart rename
			opts.desc = "Rename"
			keymap.set("n", "<Leader>lr", vim.lsp.buf.rename, opts)

			-- show definition, references
			opts.desc = "Show LSP references"
			keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
			gopts.desc = "Show references"
			keymap.set("n", "<Leader>lR", "<cmd>Telescope lsp_references<CR>", gopts)

			-- mapping to restart lsp if necessary
			opts.desc = "Restart LSP"
			keymap.set("n", "<Leader>ls", ":LspRestart<CR>", opts)

			-- show lsp type definitions
			opts.desc = "Show LSP type definitions"
			keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
			gopts.desc = "Show type definitions"
			keymap.set("n", "<Leader>lt", "<cmd>Telescope lsp_type_definition<CR>", gopts)
		end

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- configure html server
		lspconfig["html"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure typescript server with plugin
		lspconfig["tsserver"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure css server
		lspconfig["cssls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure tailwindcss server
		lspconfig["tailwindcss"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure svelte server
		lspconfig["svelte"].setup({
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)

				vim.api.nvim_create_autocmd("BufWritePost", {
					pattern = { "*.js", "*.ts" },
					callback = function(ctx)
						if client.name == "svelte" then
							client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
						end
					end,
				})
			end,
		})

		-- configure prisma orm server
		lspconfig["prismals"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure graphql language server
		lspconfig["graphql"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
		})

		-- configure emmet language server
		lspconfig["emmet_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
		})

		-- configure python server
		lspconfig["pyright"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure lua server (with special settings)
		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})

		lspconfig["bashls"].setup({})
		lspconfig["clojure_lsp"].setup({})
		lspconfig["denols"].setup({})
	end,
}
