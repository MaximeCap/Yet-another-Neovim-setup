local map = vim.keymap.set

-- Registers
map({ "n", "x" }, "x", '"_x', { desc = "Delete without copying" })
map({ "n", "x" }, "<leader>d", '"_d', { desc = "Delete without copying" })
map("x", "<leader>p", '"_dP', { desc = "Paste without copying the replaced text" })

-- Numbers
map("n", "+", "<C-a>", { desc = "Increment number" })
map("n", "-", "<C-x>", { desc = "Decrement number" })

-- Selection
map("n", "<C-a>", "ggVG", { desc = "Select all" })

-- Tabs
map("n", "te", "<Cmd>tabedit<CR>", { desc = "New tab" })
map("n", "<Tab>", "<Cmd>tabnext<CR>", { desc = "Next tab" })
map("n", "<S-Tab>", "<Cmd>tabprevious<CR>", { desc = "Previous tab" })

-- Windows
map("n", "ss", "<Cmd>split<CR>", { desc = "Split below" })
map("n", "sv", "<Cmd>vsplit<CR>", { desc = "Split right" })
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Modes
map("i", "jk", "<Esc>", { desc = "Exit insert mode" })
map("t", "<C-x>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Move selection
map("x", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down", silent = true })
map("x", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up", silent = true })
