vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

opt.mouse = ""
local osc52 = require("vim.ui.clipboard.osc52")
local paste = Obamax.clipboard.paste
vim.g.clipboard = {
	name = "OSC 52",
	copy = { ["+"] = osc52.copy("+"), ["*"] = osc52.copy("*") },
	paste = { ["+"] = paste, ["*"] = paste },
}
opt.clipboard = "unnamedplus"

opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2

opt.iskeyword:append("-")

opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.wrap = false
opt.scrolloff = 10
opt.sidescrolloff = 8
opt.signcolumn = "yes"

opt.cmdheight = 0
opt.laststatus = 3

opt.winborder = "rounded"
opt.pumheight = 10
opt.pumblend = 10
opt.showmatch = true
opt.matchtime = 2
opt.fillchars:append({ diff = "╱" })
opt.title = true

opt.ignorecase = true
opt.smartcase = true
opt.path:append("**")
opt.wildmode = "longest:full,full"
opt.wildignore:append({ "*/node_modules/*", "*.o", "*.obj", "*.class", "*.jar" })

opt.swapfile = false
opt.writebackup = false
opt.undofile = true
opt.undodir = vim.fn.stdpath("cache") .. "/undodir"

opt.updatetime = 300
opt.timeoutlen = 500
opt.ttimeoutlen = 0

opt.splitright = true
opt.splitbelow = true

opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldlevel = 99

require("vim._core.ui2").enable({
	msg = {
		targets = {
			[""] = "msg",
			emsg = "pager",
			echoerr = "pager",
			lua_error = "pager",
			rpc_error = "pager",
			list_cmd = "pager",
			verbose = "pager",
			shell_cmd = "pager",
			shell_err = "pager",
			shell_out = "pager",
			shell_ret = "pager",
			progress = "pager",
			search_count = "cmd",
			search_cmd = "cmd",
			completion = "cmd",
			wildlist = "cmd",
			confirm = "cmd",
			typed_cmd = "cmd",
		},
		msg = { height = 0.3, timeout = 5000 },
		pager = { height = 0.5 },
	},
})
