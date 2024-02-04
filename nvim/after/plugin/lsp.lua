local lsp = require('lsp-zero')

lsp.preset("recommended")

lsp.ensure_installed({
	'rust_analyzer'
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
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
})

lsp.set_sign_icons({})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
	source  = {
		{ name = 'nvim_lsp' },
		{ name = 'buffer' },
		{ name = 'path' },
	}
})

lsp.on_attach(function(client, bufnr)
	local keymap_opts = { buffer = bufnr, remap = false }
	-- Code navigation and shortcuts
	vim.keymap.set("n", "K", vim.lsp.buf.hover, keymap_opts)
	vim.keymap.set("n", "gD", vim.lsp.buf.implementation, keymap_opts)
	vim.keymap.set("n", "<c-h>", vim.lsp.buf.signature_help, keymap_opts)
	vim.keymap.set("n", "1gD", vim.lsp.buf.type_definition, keymap_opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, keymap_opts)
	vim.keymap.set("n", "g0", vim.lsp.buf.document_symbol, keymap_opts)
	vim.keymap.set("n", "gW", vim.lsp.buf.workspace_symbol, keymap_opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, keymap_opts)
	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, keymap_opts)
	vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, keymap_opts)
	vim.keymap.set({ "n", "v" }, "<leader>cf", vim.lsp.buf.format, keymap_opts)
	vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, keymap_opts)
	vim.keymap.set("n", "<leader>dN", vim.diagnostic.goto_prev, keymap_opts)
	vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float, keymap_opts)
end)

require("lspconfig").ltex.setup {
	on_attach = function(client, bufnr)
		-- rest of your on_attach process.
		require("ltex_extra").setup {
			-- table <string> : languages for witch dictionaries will be loaded, e.g. { "es-AR", "en-US" }
			-- https://valentjn.github.io/ltex/supported-languages.html#natural-languages
			load_langs = { "en-US", "de-DE" }, -- en-US as default
			-- boolean : whether to load dictionaries on startup
			init_check = true,
			-- string : relative or absolute path to store dictionaries
			-- e.g. subfolder in the project root or the current working directory: ".ltex"
			-- e.g. shared files for all projects:  vim.fn.expand("~") .. "/.local/share/ltex"
			path = vim.fn.expand("~") .. "/.local/share/ltex",
			-- string : "none", "trace", "debug", "info", "warn", "error", "fatal"
			log_level = "warn",
		}
		local keymap_opts = { buffer = bufnr, remap = false }
		vim.keymap.set("n", "K", vim.lsp.buf.hover, keymap_opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.implementation, keymap_opts)
		vim.keymap.set("n", "<c-h>", vim.lsp.buf.signature_help, keymap_opts)
		vim.keymap.set("n", "1gD", vim.lsp.buf.type_definition, keymap_opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, keymap_opts)
		vim.keymap.set("n", "g0", vim.lsp.buf.document_symbol, keymap_opts)
		vim.keymap.set("n", "gW", vim.lsp.buf.workspace_symbol, keymap_opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, keymap_opts)
		vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, keymap_opts)
		vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, keymap_opts)
		vim.keymap.set({ "n", "v" }, "<leader>cf", vim.lsp.buf.format, keymap_opts)
		vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, keymap_opts)
		vim.keymap.set("n", "<leader>dN", vim.diagnostic.goto_prev, keymap_opts)
		vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float, keymap_opts)
	end,
}

lsp.setup()
