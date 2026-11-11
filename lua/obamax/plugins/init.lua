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
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/b0o/incline.nvim",
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/rachartier/tiny-cmdline.nvim",
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
})

require("obamax.plugins.ui")
require("obamax.plugins.editor")
require("obamax.plugins.syntax")

require("obamax.plugins.keymaps")
