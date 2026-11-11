require("kanagawa").setup({
	transparent = true,
	overrides = function(colors)
		return {
			TabLineSel = { fg = colors.theme.syn.fun, bold = true },
		}
	end,
})
Obamax.background.load()
vim.cmd.colorscheme("kanagawa")

require("mini.icons").setup()
MiniIcons.mock_nvim_web_devicons()

vim.o.tabline = "%!v:lua.Obamax.tabline.render()"

require("lualine").setup({
	options = {
		theme = "auto",
		globalstatus = true,
	},
	sections = {
		lualine_x = { "filetype" },
	},
})

require("tiny-cmdline").setup({
	position = { x = "50%", y = "20%" },
})
