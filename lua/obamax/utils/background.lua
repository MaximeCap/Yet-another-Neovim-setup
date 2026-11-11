local M = {}

local file = vim.fn.stdpath("state") .. "/background"

-- Restores the background saved by the last toggle, dark by default.
function M.load()
	local ok, lines = pcall(vim.fn.readfile, file)
	vim.o.background = ok and lines[1] == "light" and "light" or "dark"
end

-- Flips between light and dark and remembers the choice across restarts.
function M.toggle()
	vim.o.background = vim.o.background == "dark" and "light" or "dark"
	vim.fn.writefile({ vim.o.background }, file)
end

return M
