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

			-- Define the autocmd function for toggling CursorHold
			function ToggleCursorHold()
				-- Check if the autocmd exists by looking for the group
				if vim.fn.exists("#vimtex_cursorhold") > 0 then
					-- Disable CursorHold autocmd
					vim.cmd("autocmd! vimtex_cursorhold") -- Clear the group
					print("CursorHold autocmd disabled.")
				else
					-- Enable CursorHold autocmd for .tex files
					vim.cmd([[
            augroup vimtex_cursorhold
              autocmd!
              autocmd CursorHold *.tex silent VimtexView
            augroup END
          ]])
					print("CursorHold autocmd enabled.")
				end
			end

			-- Key mapping to toggle the CursorHold autocmd using <leader>lu
			vim.api.nvim_set_keymap('n', '<leader>lu', ':lua ToggleCursorHold()<CR>', { noremap = true, silent = true })
		end,
	}
}
