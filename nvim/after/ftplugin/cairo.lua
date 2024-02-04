-- vim.opt.formatprg= "cairo-format"
vim.keymap.set("n", "<leader>cf", function()
	vim.cmd("silent write")
	vim.cmd("silent !cairo-format -i %")
end)
