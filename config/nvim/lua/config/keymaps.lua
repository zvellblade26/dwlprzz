local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local map = vim.api.nvim_set_keymap
map("", "<Space>", "<Nop>", opts)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- netrw
map("n", "<leader>e", ":Ex 25<cr>", opts)

-- indenting
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Move Lines
map("v", "J", ":m '>+1<cr>gv=gv", opts)
map("v", "K", ":m '<-2<cr>gv=gv", opts)

-- scrolling remaps
map("n", "<C-j>", "<C-d>zz", opts)
map("n", "<C-k>", "<C-u>zz", opts)
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

-- clipboard
map("v", "<leader>y", "\"+y", opts)
map("v", "<leader>p", "\"_dP", opts)
map("v", "<leader>d", "\"_d", opts)

-- Move to window using the <ctrl> hjkl keys
--map("n", "<C-h>", "<C-w>h", opts)
--map("n", "<C-j>", "<C-w>j", opts)
--map("n", "<C-k>", "<C-w>k", opts)
--map("n", "<C-l>", "<C-w>l", opts)

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", opts)
map("n", "<C-Down>", "<cmd>resize -2<cr>", opts)
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", opts)
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", opts)

-- buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", opts)
map("n", "<S-l>", "<cmd>bnext<cr>", opts)
map("n", "[b", "<cmd>bprevious<cr>", opts)
map("n", "]b", "<cmd>bnext<cr>", opts)
map("n", "<leader>bb", "<cmd>e #<cr>", opts)
map("n", "<leader>`", "<cmd>e #<cr>", opts)

-- save file
map("i", "<C-s>", "<cmd>w<cr><esc>", opts)
map("x", "<C-s>", "<cmd>w<cr><esc>", opts)
map("n", "<C-s>", "<cmd>w<cr><esc>", opts)
map("s", "<C-s>", "<cmd>w<cr><esc>", opts)


-- automatically close things
-- map("i", "'", "''<left>", opts)
-- map("i", "\"", "\"\"<left>", opts)
-- map("i", "(", "()<left>", opts)
-- map("i", "[", "[]<left>", opts)
-- map("i", "{", "{}<left>", opts)
-- map("i", "{;", "{};<left><left>", opts)
-- map("i", "/*", "/**/<left><left>", opts)

map("v", "<leader>r", "\"hy:%s/<C-r>h//g<left><left>", opts)
