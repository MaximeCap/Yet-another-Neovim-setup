require("snacks").setup({
	words = { enabled = true },
	scroll = { enabled = false },
	picker = {
		sources = {
			files = { hidden = true },
			grep = { hidden = true },
		},
	},
})

require("oil").setup({
	default_file_explorer = true,
	columns = { "icon", "mtime" },
	view_options = { show_hidden = true },
	lsp_file_methods = { autosave_changes = true },
	float = { border = "rounded" },
})
