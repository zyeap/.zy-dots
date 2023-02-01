-- General settings
local set = vim.opt

set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true

set.splitbelow = true
set.splitright = true
set.wrap = true

set.cursorline = true
set.number = true
set.relativenumber = true
set.fileencoding = 'utf-8'
set.termguicolors = true
set.mouse = 'a'

set.clipboard = 'unnamed'
set.undofile = true

-- Mappings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- syntax: mode, keybinding, command, options
map('', '<C-h>', '<C-w>h', opts)
map('', '<C-j>', '<C-w>j', opts)
map('', '<C-k>', '<C-w>k', opts)
map('', '<C-l>', '<C-w>l', opts)

map('n', '<C-s>', ':w<CR>', opts)
map('n', '<leader>q', ':q<CR>', opts)
map('n', '<leader>c', ':bd<CR>', opts)
map('n', '<leader>h', ':noh<CR>', opts)

-- telescope mappings
map('n', '<leader>f', ':Telescope find_files<CR>', opts)
map('n', '<leader>s', ':Telescope live_grep<CR>', opts)
map('n', '<leader>gc', ':Telescope git_commits<CR>', opts)
map('n', '<leader>gb', ':Telescope git_branches<CR>', opts)
map('n', '<leader>gs', ':Telescope git_status<CR>', opts)

-- Other plugin mappings
map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)
map('n', '<leader>ps', ':PackerSync<CR>', opts)
map('n', '<leader>u', ':UndotreeToggle<CR>', opts)
map('n', '<S-l>', ':BufferLineCycleNext<CR>', opts)
map('n', '<S-h>', ':BufferLineCyclePrev<CR>', opts)

-- Autocommands
local autocmd = vim.api.nvim_create_autocmd

autocmd('FileType', {
	pattern = 'lua',
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
	end
})

autocmd('FileType', {
	pattern = 'py',
	callback = function()
		vim.opt_local.shiftwidth = 4
		vim.opt_local.tabstop = 4
	end
})

-- Colorscheme
vim.cmd [[colorscheme dracula]]

-- Autopairs
require("nvim-autopairs").setup {}

-- Commenting
require("Comment").setup {
	toggler = {
		line = '<leader>/',
		block = '<leader>-'
	},
	opleader = {
		line = '<leader>/',
		block = '<leader>-'
	}
}
