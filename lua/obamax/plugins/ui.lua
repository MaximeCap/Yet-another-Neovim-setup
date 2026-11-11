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

require("mini.icons").setup({
	-- Diagnostic signs, so the gutter draws from the same icon set as everything else.
	lsp = {
		error = { glyph = "\u{f057}", hl = "DiagnosticError" },
		warn = { glyph = "\u{f071}", hl = "DiagnosticWarn" },
		info = { glyph = "\u{f05a}", hl = "DiagnosticInfo" },
		hint = { glyph = "\u{f0eb}", hl = "DiagnosticHint" },
	},
})
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
