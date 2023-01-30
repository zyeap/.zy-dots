-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd [[packadd packer.nvim]]
end

require ('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Startup optimization
  use 'lewis6991/impatient.nvim'
  use 'nathom/filetype.nvim'

  -- UI/efficiency related plugins
  use 'Mofiqul/dracula.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua' -- File explorer
  use 'nvim-lualine/lualine.nvim'
  use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically
  use 'windwp/nvim-autopairs' -- Autocomplete brackets/parentheses
  use { 'akinsho/bufferline.nvim', tag = "v3.*" }
  use 'mbbill/undotree'
  use 'lewis6991/gitsigns.nvim'
  use 'numToStr/Comment.nvim'

  -- LSP configuration plugins
  use 'neovim/nvim-lspconfig'
  use 'folke/neodev.nvim'
  use 'williamboman/mason.nvim' -- LSP manager
  use 'williamboman/mason-lspconfig.nvim'
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use 'onsails/lspkind.nvim' -- icons
  use 'j-hui/fidget.nvim' -- LSP loading info
  use 'jose-elias-alvarez/null-ls.nvim' -- LSP diagnostics, code actions, formatting

  -- Treesitter config plugins
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }
  use 'nvim-treesitter/nvim-treesitter-refactor'

  -- Telescope plugin
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
end)
