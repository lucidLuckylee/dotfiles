return {
	{
		"akinsho/git-conflict.nvim",
		version = "*",
		config = true
	},

	{
		"lewis6991/gitsigns.nvim",
		version = "*",
		config = function()
			require('gitsigns').setup{
				on_attach = function(bufnr)
					local gs = package.loaded.gitsigns

					local function map(mode, l, r, opts)
						opts = opts or {}
						opts.buffer = bufnr
						vim.keymap.set(mode, l, r, opts)
					end

					-- Navigation
					map('n', '<leader>gn', function()
						if vim.wo.diff then return '<leader>gN' end
						vim.schedule(function() gs.next_hunk() end)
						return '<Ignore>'
					end, {expr=true})

					map('n', '<leader>gN', function()
						if vim.wo.diff then return '<leader>gn' end
						vim.schedule(function() gs.prev_hunk() end)
						return '<Ignore>'
					end, {expr=true})

					map('n', '<leader>gS', gs.stage_buffer)
					map('n', '<leader>gs', gs.stage_hunk)
					map('n', '<leader>gb', function() gs.blame_line{full=true} end)
					map('n', '<leader>gd', gs.diffthis)
					map('n', '<leader>gR', gs.reset_buffer)
					map('n', '<leader>gr', gs.reset_buffer)
				end
			}
		end,

	}



}
