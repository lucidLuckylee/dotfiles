return {
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		lazy = true,
		config = false,
		init = function()
			-- Disable automatic setup, we are doing it manually
			vim.g.lsp_zero_extend_cmp = 0
			vim.g.lsp_zero_extend_lspconfig = 0
		end,
	},
	{
		'williamboman/mason.nvim',
		lazy = false,
		config = true,
	},

	-- Autocompletion
	{
		'hrsh7th/nvim-cmp',
		event = 'InsertEnter',
		dependencies = {
			{ 'L3MON4D3/LuaSnip' },
		},
		config = function()
			-- Here is where you configure the autocompletion settings.
			local lsp_zero = require('lsp-zero')
			lsp_zero.extend_cmp()

			-- And you can configure cmp even more, if you want to.
			local cmp = require('cmp')
			local cmp_select = { behavior = cmp.SelectBehavior.Select }

			cmp.setup({
				formatting = lsp_zero.cmp_format({ details = true }),
				mapping = cmp.mapping.preset.insert({
					["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select),
					["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-q>"] = cmp.mapping.close(),
					["<C-Space>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),
					["<C-e"] = cmp.mapping.complete(),
				}),
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body)
					end,
				},
			})
		end
	},

	-- LSP
	{
		'neovim/nvim-lspconfig',
		cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = {
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'williamboman/mason-lspconfig.nvim' },
		},
		config = function()
			-- This is where all the LSP shenanigans will live
			local lsp_zero = require('lsp-zero')
			lsp_zero.extend_lspconfig()

			--- if you want to know more about lsp-zero and mason.nvim
			--- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
			lsp_zero.on_attach(function(client, bufnr)
				---- Lsp keybinds
				-- Enable inlay hints
				local keymap_opts = { buffer = bufnr }
				if client.server_capabilities.inlayHintProvider then
					vim.lsp.inlay_hint.enable(true, { bufnr })
					vim.keymap.set("n", "<leader>ch", function()
						vim.lsp.inlay_hint.enable(
							not vim.lsp.inlay_hint.is_enabled({ bufnr }), { bufnr })
					end)
				end
				-- Formatting with formatter.nvim as fallback
				if client.server_capabilities.documentFormattingProvider or client.server_capabilities.documentRangeFormattingProvider then
                    vim.keymap.set({ "n", "v" }, "<leader>cf", vim.lsp.buf.format, keymap_opts)
                else
                    vim.keymap.set({ "n", "v" }, "<leader>cf", vim.cmd.Format, keymap_opts)
                end

				vim.keymap.set("n", "K", vim.lsp.buf.hover, keymap_opts)
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, keymap_opts)
				vim.keymap.set("n", "<c-h>", vim.lsp.buf.signature_help, keymap_opts)
				vim.keymap.set("n", "1gD", vim.lsp.buf.type_definition, keymap_opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, keymap_opts)
				vim.keymap.set("n", "g0", vim.lsp.buf.document_symbol, keymap_opts)
				vim.keymap.set("n", "gW", vim.lsp.buf.workspace_symbol, keymap_opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, keymap_opts)
				vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, keymap_opts)
				vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, keymap_opts)
				vim.keymap.set("n", "<leader>in", vim.diagnostic.goto_next, keymap_opts)
				vim.keymap.set("n", "<leader>iN", vim.diagnostic.goto_prev, keymap_opts)
				vim.keymap.set("n", "<leader>io", vim.diagnostic.open_float, keymap_opts)
			end)

			require('mason-lspconfig').setup({
				ensure_installed = {},
				handlers = {
					-- this first function is the "default handler"
					-- it applies to every language server without a "custom handler"
					function(server_name)
						require('lspconfig')[server_name].setup({})
					end,

					-- this is the "custom handler" for `lua_ls`
					lua_ls = function()
						-- (Optional) Configure lua language server for neovim
						local lua_opts = lsp_zero.nvim_lua_ls()
						require('lspconfig').lua_ls.setup(lua_opts)
					end,
				}
			})
		end
	},

	{
		"mhartington/formatter.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require('formatter').setup({
				filetype = {
					python = {
						-- black
						function()
							return {
								exe = "black",
								args = { "-" },
								stdin = true,
							}
						end,
					},
					-- other formatters for other filetypes can be added here
				},
			})
		end,
	},
}
