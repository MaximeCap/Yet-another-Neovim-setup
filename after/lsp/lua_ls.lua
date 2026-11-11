-- Teach lua_ls about Neovim's runtime so `vim` and its API are known in this config.
return {
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			workspace = {
				checkThirdParty = false,
				library = { vim.env.VIMRUNTIME },
			},
			diagnostics = {
				-- Globals set by plugins at runtime.
				globals = { "MiniIcons", "Snacks" },
			},
		},
	},
}
