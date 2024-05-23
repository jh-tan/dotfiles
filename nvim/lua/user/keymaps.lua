local opts = { noremap = true, silent = true }

local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Remap escape to jk
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Remove highlight
keymap("n", "<ESC>", ":noh<CR>", opts)

-- Move line 
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)
keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Quick navigate within/between line
keymap("n", "H", "^", opts)
keymap("n", "L", "g_", opts)
keymap("n", "<Leader>1", "%", opts)
keymap("v", "H", "^", opts)
keymap("v", "L", "g_", opts)
keymap("v", "<Leader>1", "%", opts)

-- Remove within Line
keymap("n", "dH", "d^", opts)
keymap("n", "dL", "dg_", opts)

-- Navigate between buffer
keymap("n", "<A-q>", ":bprevious<CR>", opts)
keymap("n", "<A-e>", ":bnext<CR>", opts)
keymap("n", "<A-w>", ":bp <BAR> bd # <CR>", opts)
keymap("i", "<A-q>", "<ESC>:bprevious<CR>", opts)
keymap("i", "<A-w>", "<ESC>:bp <BAR> bd # <CR>", opts)

-- Swap buffer
keymap( "n", "<C-Left>", ":BufferLineMovePrev<CR>", opts)
keymap( "n", "<C-Right>", ":BufferLineMoveNext<CR>", opts)

-- Navigate between window
keymap("n", "<A-l>", "<C-W>l", opts)
keymap("n", "<A-h>", "<C-W>h", opts)
keymap("n", "<A-a>j", "<C-W>j", opts)
keymap("n", "<A-a>", "<C-W>k", opts)

-- Write and quit all
keymap("n", "<Leader>wq", ":wqa<CR>", opts)

-- Write all without quit
keymap("n", "<Leader>ww", ":wa<CR>", opts)

-- Quit all without write
keymap("n", "<Leader>qq", ":qa!<CR>", opts)

-- Close window
keymap("n", "<Leader>cc", ":close<CR>", opts)

-- Highlight the line without the newline character
keymap("n", "vil", "^v$h", opts)

-- Yank line without the newline character
keymap("n", "<Leader>y", "^y$", opts)

-- Yank all
keymap("n", "ya", ":%y+<CR>", opts)

-- Select all
keymap("n", "va", "ggVG", opts)
keymap("v", "va", "ggVG", opts)

-- Resize
keymap("n", "<A-a><Up>", "<C-w>+", opts)
keymap("n", "<A-a><Down>", "<C-w>-", opts)

-- Telescope
keymap( "n", "<C-f>", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap( "i", "<C-f>", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
-- Grep all *open* files
keymap( "n", "<Leader>F", "<cmd>lua require('telescope.builtin').live_grep({grep_open_files=true})<cr>", opts)
-- Grep all files (Global)
keymap( "n", "<Leader>af", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
-- Grep current file
keymap( "n", "<Leader>f", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", opts)
-- Grep opened tab
keymap( "n", "<Leader><space>", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
-- Grep all references to current function
keymap( "n", "gr", "<cmd>lua require('telescope.builtin').lsp_references()<cr>", opts)

-- Nvim-tree
keymap( "n", "<Leader>t", ":NvimTreeToggle<CR>", opts)

-- Auto Format
keymap( "n", "<Leader>i", ":Format<CR>", opts)

