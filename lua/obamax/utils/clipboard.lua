local M = {}

-- Paste reads Neovim's own register, since terminals can't reliably answer OSC 52 reads.
function M.paste()
	return { vim.split(vim.fn.getreg(""), "\n"), vim.fn.getregtype("") }
end

return M
