vim.api.nvim_create_autocmd("PackChanged", {
	group = vim.api.nvim_create_augroup("obamax_pack_hooks", { clear = true }),
	desc = "Update tree-sitter parsers along with nvim-treesitter",
	callback = function(ev)
		if ev.data.spec.name == "nvim-treesitter" and ev.data.kind == "update" then
			if not ev.data.active then
				vim.cmd.packadd("nvim-treesitter")
			end
			vim.cmd("TSUpdate")
		end
	end,
})

vim.pack.add({
	"https://github.com/folke/snacks.nvim",
	"https://github.com/rebelot/kanagawa.nvim",
	"https://github.com/nvim-mini/mini.icons",
	"https://github.com/nvim-mini/mini.pairs",
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/b0o/incline.nvim",
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/rachartier/tiny-cmdline.nvim",
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	"https://github.com/folke/todo-comments.nvim",
	"https://github.com/brenoprata10/nvim-highlight-colors",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
})

require("obamax.plugins.ui")
require("obamax.plugins.editor")
require("obamax.plugins.syntax")
require("obamax.plugins.lsp")
require("obamax.plugins.completion")

require("obamax.plugins.keymaps")
