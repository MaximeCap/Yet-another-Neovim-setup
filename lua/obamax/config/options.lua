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
