vim.loader.enable()

_G.Obamax = require("obamax.utils")

require("obamax.config.options")
require("obamax.config.keymaps")
require("obamax.config.autocmds")
require("obamax.config.commands")

require("obamax.plugins")
