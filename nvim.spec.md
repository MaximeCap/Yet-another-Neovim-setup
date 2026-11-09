# Nvim Configuration

## Workflow

- Read the Spec and implement only the step I name. Add nothing beyond it
- Check your work lightly
    - Neovim start without errors: `nvim --headless +qa`
    - New keymaps exist: `verbose map <key>`
- Don't do test for test, I'll check the behavior after `ZR`

## 0. Prerequisites

### 0.1 Neovim

- Neovim 0.12
    - The config relies on built-ins that landed in 0.12
        - `vim.pack`, `vim.lsp.enable`, and the ui2 message ui

### 0.2 CLI tools

- `git`: `vim.pack` clones plugins with it
- `tree-sitter` CLI and a C compiler: `nvim-treesitter`'s main branchs builds parsers locally 
- `curl` and `tar`: parser and blink.cmp binary downloads
- Node.JS + npm or bun: `Mason` installs most language servers through them
- `ripgrep` and `fd` : back the text search and the file finder
- `lazygit` and `git-delta`: The git UI and its diff renderer

### 0.3 Font

- A nerd font
    - Icons appear in the tabline, statusline, completion and file explorer, so a plain font shows boxes

### 0.4 Git

- The config folder is a git repository
- `.gitignore` lists `nvim-pack-lock.json`


## 1. Foundation

### 1.1 Layout

- `~/.config/nvim`: The config root folder
    - `init.lua`: Enables `vim.loader` for faster startup, then requiires thoses files directly, in order:
        1. `obamax.utils`, assigned to the global `Obamax`
        2. `obamax.config.options`, `.keymaps`, `.autocmds`, `.commands`
        3. `obamax.plugins`
    - `lua/obamax`: My config lives here
        - `utils`: Shared helpers
            - `init.lua`: returns a table or helper modules, empty for now. LAter steps add mopdules like `utils/editor.lua`, exposed as `editor`
        - `config/`: plain Neovim settings, one file per name above
        - `plugins/`
            - `init.lua`: will install every plugin in one `vim.pack.add` call, then require each group file
            - Each plugin group gets its own file next to it later (e.g., `ui.lua`), which configures its plugins with `require("<plugin>").setup({...})
            - `keymaps.lua`: every keymap that uses a plugin, required last so all plugins are set up first. Group files hold no keymaps
        - Lua files are indented with tabs, formatted by stylua with its defaults

### 1.2 Leader and basics

- Leader and local leader are **space**
- Mouse is **off**
- Clipboard should copy to system clipboard
- Indent is **2 spaces**: `tabstop`, `shiftwidth` and softabstop` are all **2**.
- `-` counts as part of a word, so `foo-bar` is one word.
    - Fits CSS classes and kebab-case names
