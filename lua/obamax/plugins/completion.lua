-- Kind icon and its color from mini.icons, the shared icon set.
local function kind_icon(ctx)
	return MiniIcons.get("lsp", ctx.kind)
end
local function kind_hl(ctx)
	local _, hl = MiniIcons.get("lsp", ctx.kind)
	return hl
end

require("blink.cmp").setup({
	completion = {
		accept = { auto_brackets = { enabled = true } },
		documentation = { auto_show = true, auto_show_delay_ms = 200 },
		menu = {
			draw = {
				treesitter = { "lsp" },
				components = {
					kind_icon = { text = kind_icon, highlight = kind_hl },
				},
			},
		},
	},
	cmdline = {
		completion = {
			menu = {
				auto_show = function()
					return vim.fn.getcmdtype() == ":"
				end,
			},
			list = { selection = { preselect = false } },
		},
	},
})
