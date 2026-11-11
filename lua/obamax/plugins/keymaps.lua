local map = vim.keymap.set

-- UI
map("n", "<leader>us", Obamax.background.toggle, { desc = "Toggle light/dark background" })

-- Words
map("n", "]]", function()
	Snacks.words.jump(vim.v.count1)
end, { desc = "Next reference" })
map("n", "[[", function()
	Snacks.words.jump(-vim.v.count1)
end, { desc = "Previous reference" })

-- Pickers
map("n", "<leader>ff", function()
	Snacks.picker.files()
end, { desc = "Find files" })
map("n", "<leader><leader>", function()
	Snacks.picker.files()
end, { desc = "Find files" })
map("n", "<leader>fb", function()
	Snacks.picker.buffers()
end, { desc = "Find buffers" })
map("n", "<leader>fg", function()
	Snacks.picker.grep()
end, { desc = "Grep" })
map("n", "<leader>fw", function()
	Snacks.picker.lsp_workspace_symbols()
end, { desc = "Workspace symbols" })
map("n", "<leader>fs", function()
	Snacks.picker.lsp_symbols()
end, { desc = "Document symbols" })

-- File explorer
map("n", "<leader>e", function()
	require("oil").open_float(nil, { preview = {} })
end, { desc = "File explorer" })
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("obamax_oil_keymaps", { clear = true }),
	pattern = "oil",
	desc = "Oil buffer keymaps",
	callback = function(args)
		map("n", "q", require("oil").close, { buffer = args.buf, desc = "Close file explorer" })
	end,
})
