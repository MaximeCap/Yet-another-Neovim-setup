-- Returns true when one of `names` exists in the buffer's folder or any parent.
local function has_config(names)
	return function(_, ctx)
		return vim.fs.find(names, { path = ctx.dirname, upward = true })[1] ~= nil
	end
end

-- oxfmt only runs in projects that opted into it: an oxfmt config, or a Vite+ config
-- (a vite.config that imports vite-plus), so prettier projects keep prettier.
local function has_oxfmt_config(self, ctx)
	if has_config({ ".oxfmtrc.json", ".oxfmtrc.jsonc" })(self, ctx) then
		return true
	end
	local vite_config = vim.fs.find(
		{ "vite.config.ts", "vite.config.mts", "vite.config.js", "vite.config.mjs" },
		{ path = ctx.dirname, upward = true }
	)[1]
	if not vite_config then
		return false
	end
	local ok, lines = pcall(vim.fn.readfile, vite_config)
	return ok and table.concat(lines, "\n"):find("vite%-plus") ~= nil
end

local web = { "oxfmt", "biome", "prettierd", "prettier", stop_after_first = true }

require("conform").setup({
	formatters_by_ft = {
		javascript = web,
		typescript = web,
		javascriptreact = web,
		typescriptreact = web,
		json = web,
		css = web,
		scss = web,
		less = web,
		html = web,
		markdown = web,
		mdx = web,
		yaml = web,
		lua = { "stylua" },
	},
	formatters = {
		oxfmt = { condition = has_oxfmt_config },
		biome = { condition = has_config({ "biome.json", "biome.jsonc" }) },
	},
	format_on_save = function(bufnr)
		if vim.b[bufnr].disable_autoformat then
			return
		end
		return { timeout_ms = 100, lsp_format = "fallback" }
	end,
})
