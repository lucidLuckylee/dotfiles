-- nvimautocmd FileType * autocmd TextChanged,InsertLeave <buffer> if &readonly == 0 | silent write | endif
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
	pattern = { "*.md" },
	command = "silent write" })
