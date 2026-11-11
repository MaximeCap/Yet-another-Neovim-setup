local M = {}

local pad = string.rep(" ", 3)
local max_path = 20

-- Keeps the end of a long path, which names the directory, and marks the cut with an ellipsis.
local function shorten(path)
	if vim.fn.strchars(path) <= max_path then
		return path
	end
	return "…" .. vim.fn.strcharpart(path, vim.fn.strchars(path) - (max_path - 1))
end

-- The text shown for a buffer: an oil buffer shows its directory, any other its file with an icon.
local function label(buf)
	if vim.bo[buf].filetype == "oil" then
		return shorten(vim.fn.fnamemodify(require("oil").get_current_dir(buf) or "", ":~"))
	end
	local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ":t")
	if name == "" then
		return MiniIcons.get("default", "file") .. " [No Name]"
	end
	return MiniIcons.get("file", name) .. " " .. name
end

-- One label per tab, for its active window's buffer, padded on both sides.
function M.render()
	local line = {}
	local current = vim.api.nvim_get_current_tabpage()
	for nr, tab in ipairs(vim.api.nvim_list_tabpages()) do
		local buf = vim.api.nvim_win_get_buf(vim.api.nvim_tabpage_get_win(tab))
		local hl = tab == current and "%#TabLineSel#" or "%#TabLine#"
		line[#line + 1] = ("%s%%%dT%s%s%s"):format(hl, nr, pad, label(buf), pad)
	end
	return table.concat(line) .. "%#TabLineFill#%T"
end

return M
