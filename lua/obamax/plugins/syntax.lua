require("nvim-treesitter").install({
	"css",
	"diff",
	"dockerfile",
	"go",
	"helm",
	"http",
	"javascript",
	"jsdoc",
	"json",
	"lua",
	"luadoc",
	"luap",
	"markdown",
	"python",
	"rust",
	"scss",
	"sql",
	"toml",
	"tsx",
	"typescript",
	"vim",
	"vimdoc",
	"yaml",
})


require("todo-comments").setup()
-- todo-comments only highlights when it first sees a window, so a file opened in a window
-- that's already open (:e, picker, oil) stays plain until a scroll or edit. Nudge it.

-- nvim-highlight-colors paints colors, so the LSP doesn't paint them a second time.
vim.lsp.document_color.enable(false)
require("nvim-highlight-colors").setup({
	render = "background",
	enable_hex = true,
	enable_rgb = true,
	enable_hsl = true,
	enable_ansi = true,
	enable_var_usage = true,
})
