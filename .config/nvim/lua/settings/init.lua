-- General settings
local set = vim.opt
local global = vim.g

set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true
set.modeline = false

set.splitbelow = true
set.splitright = true
set.wrap = false

set.cursorline = true
set.number = true
set.relativenumber = true
set.fileencoding = "utf-8"
set.termguicolors = true
set.mouse = "a"

set.clipboard = "unnamedplus"
set.undofile = true

-- Mappings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

global.mapleader = " "
global.maplocalleader = " "

-- syntax: mode, keybinding, command, options
map("", "<C-h>", "<C-w>h", opts)
map("", "<C-j>", "<C-w>j", opts)
map("", "<C-k>", "<C-w>k", opts)
map("", "<C-l>", "<C-w>l", opts)

map("n", "<C-s>", ":w<CR>", opts)
map("n", "<C-q>", ":q<CR>", opts)
map("n", "<leader>x", ":bd<CR>", opts)
map("n", "<leader>h", ":noh<CR>", opts)

-- Other plugin mappings
map("n", "<leader>L", ":Lazy<CR>", opts)
map("n", "<leader>M", ":Mason<CR>", opts)
map("n", "<S-l>", ":BufferLineCycleNext<CR>", opts)
map("n", "<S-h>", ":BufferLineCyclePrev<CR>", opts)

-- Colorscheme
vim.cmd([[colorscheme catppuccin-frappe]])
vim.cmd([[highlight IndentBlanklineContextChar guifg=#f4b8e4 gui=nocombine]])
