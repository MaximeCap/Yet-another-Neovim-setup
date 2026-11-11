-- Every server gets blink.cmp's completion capabilities, and is told the client handles
-- file renames, so renaming in oil updates imports.
vim.lsp.config("*", {
	capabilities = require("blink.cmp").get_lsp_capabilities({
		workspace = {
			fileOperations = {
				didRename = true,
				willRename = true,
			},
		},
	}),
})

local severity = vim.diagnostic.severity
vim.diagnostic.config({
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	virtual_text = { prefix = "●", source = "if_many" },
	signs = {
		text = {
			[severity.ERROR] = MiniIcons.get("lsp", "error"),
			[severity.WARN] = MiniIcons.get("lsp", "warn"),
			[severity.INFO] = MiniIcons.get("lsp", "info"),
			[severity.HINT] = MiniIcons.get("lsp", "hint"),
		},
	},
})

require("mason").setup()
-- Enables every installed server with vim.lsp.enable, using nvim-lspconfig's configs.
-- Formatters that also ship a server mode are installed as tools only.
require("mason-lspconfig").setup({
	automatic_enable = {
		exclude = { "biome", "ruff", "stylua" },
	},
})
require("mason-tool-installer").setup({
	ensure_installed = {
		-- LSP servers
		"lua_ls",
		"gopls",
		"ts_ls",
		"tailwindcss",
		"basedpyright",
		"docker_language_server",
		"yamlls",
		"helm-ls",
		"jsonls",
		-- Linters
		"eslint",
		-- Formatters
		"biome",
		"stylua",
		"ruff",
		"prettier",
		"prettierd",
		"goimports",
		"gofumpt",
		"sqlfmt",
		"pgformatter",
		-- DAP
		"delve",
		"debugpy",
	},
	auto_update = false,
	run_on_start = true,
})
