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

### 1.3 Look of the buffer


- **Hybrid** line numbers: `number` + `relativenumber` **on**
- `cursorline` **on**. No wrap, `scrolloff` **10**,m `sidescrolloff` **8**
- `signcolumn` always **on**
    - Text doesn't jump when git or diagnostc marks appear
    - `cmdheight` **0** and one globa statusline (`laststatus` **3**)
    - Maxmises vertical space
    - **rounded** borders on every float `winborder`
    - Popup menu: at most **10** rows, slightly see-through `pumheight` **10** `pumbled` **10**
    - Matching brackets flash briefly (`showmatch` **on**, `matchtime` **2**)
    -  Diagonal `/` fill in empty diff area
    - `title` **on**

### 1.4 Search, files, undo

- `ignorecase` + `smartcase` **on**
- `path` adds  **on**, `:find` searches subfolders
- `:` completion `wildmode` is `ongest:full`, `full`, `wildignore` skips `*/node_modules/*`, `*.o`, `*.obj`, `*.class`, `*.jar`
    - `swapfile` and `writebackup` **off**. Persistent undo lives in `~/.cache/nvim/undodir`
- Undo survives closing the file. Swap files onl get in the way
- Snappier timing: `updatetime` **300**, `timeoutlen` **500**, `ttimeoutlen` **0**

### 1.5 Splits and folds

- Splits should be created on the right and below the current buffer
- Folds come from `tree-sitter` with `foldlevel` **99**
    - Folds are all open by default  and still can be closed by syntax

### 1.6 Messages

- Neovim 0.12's experimental ui2 handles messages. Turn it on at the end of `config/options.lua`
    - Short messagea: corner popup up to **30%** of the screen
        - Make it disappear after **5s**
    - Long output (errors, listings like `:ls`, `:verbose`, sheel commands and their output, progress): a scrollable pager up to **half** the screenm
    - Search count, search pattern, completion, `:` completion list and confirm prompt stay in the command line
    - Output of a command I type goes tyo the command line too,  whatever its kind.
      It expands over the bottom of the screenm until the next day, and `Enter` moves it into the pager
    - tiny-cmdline.nvim shows the `:` command line as a float bocx centered left to right, **20%** from the top. It's setup in `plugins/ui.lua`
        - With `cmdheight`0 the command line needs somewhere to appear and near the top is where the eyes already are

### 1.7 Autocmds

- Yank should be visible

### 1.8 Core keymaps

`x` -> Delete without copying
d, c and p prefixed by <leader> -> delete, change, paste without changing the yank register
`+` / `-` -> increment and decrement numbers
`<C-a>` -> Selected all
`te` -> Open a new tab
`Tab` and `Shift tab` -> cycle tabs
`ss` and `sv` -> Split
`<C-h>`, `<C-j>`, `<C-k>`, `<C-l>` -> Move between windows
`jk` on insert mode for quickly get back to normal mode
in terminal mode, `<C-x`> exit the terminal and get back to normal mode
in visual mode, J and K move the selection up and down


## 2 Look and feel

### 2.1 Colorscheme

- Kanagawa with `<leader>us` for switching between light and dark mode. The state must be saved and loaded between restart. transparent must be activated


### 2.2 icons

mini.icons, also mockin nvim-web-devicons
One icon source for every plugin

### 2.3 Tabline

Each tab show the active window's file with its icon paddedd with **3** spaces.
Active tab is bold with kanagawa palete primary color

### 2.4 statusline

- lualine, one globalbar, theme `auto` 
    - x position: we can just keep the filetype and its icons
