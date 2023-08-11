require'nvim-tree'.setup {
	update_focused_file = {
		enable      = true,
	},
	renderer = {
		group_empty = true,
		indent_markers = {
			enable = true,
		},
	},
	filters = {
		dotfiles = true,
	},
	tab = {
		sync = {
			open = true,
			close = true,
		},
	},
}

vim.keymap.set('n', '<leader>e', require"nvim-tree.api".tree.toggle)
