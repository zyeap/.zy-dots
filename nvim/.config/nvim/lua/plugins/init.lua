return {
	-- UI/efficiency related plugins
	"sainnhe/everforest",
	{
		"kyazdani42/nvim-web-devicons",
		event = "VeryLazy",
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
	{
		"windwp/nvim-autopairs", -- Autocomplete brackets/parentheses
		event = "InsertEnter",
		config = true,
	},
	{
		"tpope/vim-sleuth",
		event = { "BufReadPost", "BufNewFile" },
	},
	{
		"Vimjas/vim-python-pep8-indent", -- pep8 python indentation
		ft = "python",
	},
	{
		"mbbill/undotree", -- view past undo changes in side tree view
		keys = {
			{ "<leader>u", ":UndotreeToggle | UndotreeFocus<CR>", desc = "Undo tree toggle", silent = true},
		},
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
}
