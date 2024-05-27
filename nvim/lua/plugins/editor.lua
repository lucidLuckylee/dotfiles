return {
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		init = function()
			vim.keymap.set('n', '<leader>e', require "nvim-tree.api".tree.toggle)
		end,
		config = function()
			require 'nvim-tree'.setup {
				update_focused_file = {
					enable = true,
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
		end,
	},
	{
		'nvim-telescope/telescope.nvim',
		version = "*",
		dependencies = { 'nvim-lua/plenary.nvim' },
		init = function()
			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
			vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
			vim.keymap.set('n', '<leader>fs', function()
				builtin.grep_string({ search = vim.fn.input("Grep > ") })
			end)
		end,
	},

	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		init = function()
			local harpoon = require("harpoon")
			harpoon:setup()
			vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end)
			vim.keymap.set("n", "<leader>he", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
			vim.keymap.set("n", "<M-1>", function() harpoon:list():select(1) end)
			vim.keymap.set("n", "<M-2>", function() harpoon:list():select(2) end)
			vim.keymap.set("n", "<M-3>", function() harpoon:list():select(3) end)
			vim.keymap.set("n", "<M-4>", function() harpoon:list():select(4) end)
			vim.keymap.set("n", "<M-5>", function() harpoon:list():select(5) end)
			vim.keymap.set("n", "<M-6>", function() harpoon:list():select(6) end)
			vim.keymap.set("n", "<M-7>", function() harpoon:list():select(7) end)
			vim.keymap.set("n", "<M-8>", function() harpoon:list():select(8) end)
			vim.keymap.set("n", "<M-Tab>", function() harpoon:list():next() end)
		end,
	},

	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		lazy = false,
		config = function()
			require('lualine').setup {
				options = {
					icons_enabled = true,
					theme = 'auto',
					component_separators = { left = '', right = '' },
					section_separators = { left = '', right = '' },
					disabled_filetypes = {
						statusline = {},
						winbar = {},
					},
					ignore_focus = {},
					always_divide_middle = true,
					globalstatus = false,
					refresh = {
						statusline = 1000,
						tabline = 1000,
						winbar = 1000,
					}
				},
				sections = {
					lualine_a = { 'mode' },
					lualine_b = { 'branch', 'diff' },
					lualine_c = { { 'filename', path = 1, newfile_status = true } },
					lualine_x = { 'encoding', 'fileformat', 'filetype' },
					lualine_y = { 'progress' },
					lualine_z = { 'location' }
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { { 'filename', path = 1, } },
					lualine_x = { 'location' },
					lualine_y = {},
					lualine_z = {}
				},
				tabline = {},
				winbar = {},
				inactive_winbar = {},
				extensions = {}
			}
		end,
	},

	{
		"mbbill/undotree",
		config = function()
			vim.g.undotree_SetFocusWhenToggle = 1
			vim.g.undotree_SplitWidth = 60
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
		end,
	},

	{
		"norcalli/nvim-colorizer.lua",
		version = "*",
	},

	{

		"tpope/vim-fugitive",
		version = "*"
	},

	{
		"tpope/vim-sleuth",
		version = "*"
	},

	{
		"akinsho/git-conflict.nvim",
		version = "*"
	},
	{
		"tpope/vim-surround",
		version = "*"
	}
}
