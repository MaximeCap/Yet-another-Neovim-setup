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
