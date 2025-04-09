return {
	{
		"lervag/vimtex",
		lazy = false, -- we don't want to lazy load VimTeX
		init = function()
			-- VimTeX base configuration
			vim.g.vimtex_view_method = "zathura"
			vim.g.vimtex_view_forward_search_on_start = 1
			vim.g.vimtex_view_forward_search_on_compile = 1
			vim.g.vimtex_view_automatic = 1
			vim.g.vimtex_complete_enabled = 1

			vim.g.vimtex_compiler_latexmk = {
				out_dir = '../build',
				options = {
					"-synctex=1",
					"-interaction=nonstopmode",
					"-file-line-error",
				},
			}

			-- Make CursorHold trigger faster
			vim.o.updatetime = 500 -- time in ms before CursorHold is triggered

			-- Automatically trigger forward search when cursor stops moving
			vim.api.nvim_create_autocmd("CursorHold", {
				pattern = "*.tex",
				callback = function()
					vim.cmd("silent VimtexView") -- silently trigger forward search
				end,
			})
		end,
	}
}
