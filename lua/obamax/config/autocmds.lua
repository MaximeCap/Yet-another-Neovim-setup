local augroup = vim.api.nvim_create_augroup("obamax", { clear = true })

-- Utils
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup,
	desc = "Highlight yanked text",
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Treesitter AutoCmd
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("obamax_treesitter", { clear = true }),
	desc = "Start tree-sitter highlighting and indent when a parser exists",
	callback = function(args)
		if not pcall(vim.treesitter.start, args.buf) then
			return
		end
		vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})

-- Todo Comment Highlight AutoCmd
vim.api.nvim_create_autocmd("BufWinEnter", {
	group = vim.api.nvim_create_augroup("obamax_todo_comments", { clear = true }),
	desc = "Highlight todo comments in a buffer shown in an existing window",
	callback = function()
		local highlight = require("todo-comments.highlight")
		if highlight.enabled then
			highlight.update()
		end
	end,
})
