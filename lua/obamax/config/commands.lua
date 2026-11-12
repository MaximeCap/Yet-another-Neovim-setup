vim.api.nvim_create_user_command("ToggleFormatter", function()
	vim.b.disable_autoformat = not vim.b.disable_autoformat
	local state = vim.b.disable_autoformat and "off" or "on"
	vim.notify("Format on save " .. state .. " for this buffer", vim.log.levels.INFO)
end, { desc = "Toggle format on save for the current buffer" })
