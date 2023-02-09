return {

  -- Startup optimization
   'lewis6991/impatient.nvim',
   'nathom/filetype.nvim',

  -- UI/efficiency related plugins
   'Mofiqul/dracula.nvim',
   'kyazdani42/nvim-web-devicons',
   'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
   'windwp/nvim-autopairs', -- Autocomplete brackets/parentheses
   'mbbill/undotree',
   'lewis6991/gitsigns.nvim',
   'numToStr/Comment.nvim',

  -- LSP configuration plugins
   'neovim/nvim-lspconfig',
   'folke/neodev.nvim',
   'williamboman/mason.nvim', -- LSP manager
   'williamboman/mason-lspconfig.nvim',
   'hrsh7th/nvim-cmp', -- Autocompletion plugin
   'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
   'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
   'L3MON4D3/LuaSnip', -- Snippets plugin
   'onsails/lspkind.nvim', -- icons
   'j-hui/fidget.nvim', -- LSP loading info
   'jose-elias-alvarez/null-ls.nvim', -- LSP diagnostics, code actions, formatting

  -- Treesitter config plugins
  {
    'nvim-treesitter/nvim-treesitter',
    build = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },
   'nvim-treesitter/nvim-treesitter-refactor',

}
