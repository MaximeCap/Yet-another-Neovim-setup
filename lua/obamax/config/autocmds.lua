local augroup = vim.api.nvim_create_augroup("obamax", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup,
	desc = "Highlight yanked text",
	callback = function()
		vim.hl.on_yank()
	end,
})
