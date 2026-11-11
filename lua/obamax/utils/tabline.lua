local M = {}

local pad = string.rep(" ", 3)

-- One label per tab: the active window's file and its icon, padded on both sides.
function M.render()
	local line = {}
	local current = vim.fn.tabpagenr()
	for nr = 1, vim.fn.tabpagenr("$") do
		local win = vim.fn.tabpagewinnr(nr)
		local buf = vim.fn.tabpagebuflist(nr)[win]
		local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ":t")
		local icon = name == "" and MiniIcons.get("default", "file") or MiniIcons.get("file", name)
		local label = name == "" and "[No Name]" or name
		local hl = nr == current and "%#TabLineSel#" or "%#TabLine#"
		line[#line + 1] = ("%s%%%dT%s%s %s%s"):format(hl, nr, pad, icon, label, pad)
	end
	return table.concat(line) .. "%#TabLineFill#%T"
end

return M
