require("kanagawa").setup({
	transparent = true,
	overrides = function(colors)
		return {
			TabLineSel = { fg = colors.theme.syn.fun, bold = true },
			InclineNormal = { fg = colors.theme.syn.fun, bg = colors.theme.ui.float.bg },
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

require("incline").setup({
	window = {
		placement = { horizontal = "right", vertical = "top" },
	},
	hide = { cursorline = true },
	render = function(props)
		local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
		if name == "" then
			name = "[No Name]"
		end
		local icon, hl = MiniIcons.get("file", name)
		return {
			{ icon, group = hl },
			" ",
			name,
			vim.bo[props.buf].modified and " [+]" or "",
		}
	end,
})

require("tiny-cmdline").setup({
	position = { x = "50%", y = "20%" },
})
