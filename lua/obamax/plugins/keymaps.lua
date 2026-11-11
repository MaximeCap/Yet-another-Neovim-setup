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

