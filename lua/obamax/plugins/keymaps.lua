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

-- LSP
map("n", "gd", function()
	Snacks.picker.lsp_definitions()
end, { desc = "Go to definition" })
map("n", "gD", function()
	Snacks.picker.lsp_declarations()
end, { desc = "Go to declaration" })
map("n", "gy", function()
	Snacks.picker.lsp_type_definitions()
end, { desc = "Go to type definition" })
map("n", "gR", function()
	Snacks.picker.lsp_references()
end, { desc = "References" })
map("n", "gi", function()
	Snacks.picker.lsp_implementations()
end, { desc = "Implementations" })
-- Snacks replaces vim.ui.select, so the actions open in its picker.
map({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })

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
