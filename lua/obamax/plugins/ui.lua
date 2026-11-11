require("kanagawa").setup({
	transparent = true,
})
Obamax.background.load()
vim.cmd.colorscheme("kanagawa")

require("tiny-cmdline").setup({
	position = { x = "50%", y = "20%" },
})
