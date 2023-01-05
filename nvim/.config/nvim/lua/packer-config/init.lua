return require'packer'.startup(function()
    use 'wbthomason/packer.nvim'
    use 'Mofiqul/dracula.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'
    use 'nvim-lualine/lualine.nvim'
    use 'nanozuki/tabby.nvim'
    use 'windwp/nvim-autopairs'
    use 'fladson/vim-kitty'
    use 'lewis6991/impatient.nvim'
    use 'nathom/filetype.nvim'

    -- Mason
    use 'williamboman/mason.nvim'
		
    -- Treesitter config plugins
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'nvim-treesitter/nvim-treesitter-refactor'

    -- Telescope plugin
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
      requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- LSP config plugins
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
    use 'onsails/lspkind.nvim' -- icons
    use 'jose-elias-alvarez/null-ls.nvim' -- Diagnostics, code actions
end)
