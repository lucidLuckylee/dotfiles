vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	-- use 'Mofiqul/dracula.nvim'
	use 'yeddaif/neovim-purple'
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use {
		'ThePrimeagen/harpoon',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use 'mbbill/undotree'
	use 'tpope/vim-fugitive'
	use{
		'kyazdani42/nvim-tree.lua',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}
	use 'norcalli/nvim-colorizer.lua'
	use {
		'nvim-treesitter/nvim-treesitter-context',
		requires = { 'nvim-treesitter/nvim-treesitter' }
	}
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},     -- Required
			{'hrsh7th/cmp-nvim-lsp'}, -- Required
			{'L3MON4D3/LuaSnip'},     -- Required
		}
	}
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}
	use 'lewis6991/gitsigns.nvim'
	use 'akinsho/git-conflict.nvim'
	use 'tpope/vim-surround'
	use({
		"epwalsh/obsidian.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
			"nvim-telescope/telescope.nvim",
		},
	})
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'saadparwaiz1/cmp_luasnip'
	use "rafamadriz/friendly-snippets"
	use 'barreiroleo/ltex-extra.nvim'
end)
