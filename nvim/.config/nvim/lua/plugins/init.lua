return {
	-- UI/efficiency related plugins
	"Mofiqul/dracula.nvim",
	"kyazdani42/nvim-web-devicons",
	"lewis6991/gitsigns.nvim",
  {
    "windwp/nvim-autopairs", -- Autocomplete brackets/parentheses
    event = "InsertEnter",
    config = true
  },
  {
    "Vimjas/vim-python-pep8-indent", -- pep8 python indentation
    ft = "python",
  },
  {
   'mbbill/undotree', -- view past undo changes in side tree view
    keys = {
      {'<leader>u',  ':UndotreeToggle<CR>', desc = 'Undo tree toggle'}
    }
  },

	-- LSP configuration plugins
	"neovim/nvim-lspconfig",
	"folke/neodev.nvim",
	"williamboman/mason.nvim", -- LSP manager
	"williamboman/mason-lspconfig.nvim",
	"hrsh7th/nvim-cmp", -- Autocompletion plugin
	"hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
	"saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
	"L3MON4D3/LuaSnip", -- Snippets plugin
	"onsails/lspkind.nvim", -- icons
	"j-hui/fidget.nvim", -- LSP loading info
	"jose-elias-alvarez/null-ls.nvim", -- LSP diagnostics, code actions, formatting

	-- Treesitter config plugins
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
	},
	"nvim-treesitter/nvim-treesitter-refactor",
}
