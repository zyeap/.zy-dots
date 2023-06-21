return {
	-- UI/efficiency related plugins
	{
		"catppuccin/nvim",
		name = "catppuccin",
	},
	{
		"kyazdani42/nvim-web-devicons",
		event = "VeryLazy",
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		config = true,
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
		"fatih/vim-go",
		ft = "go"
	},
	{
		"mbbill/undotree", -- view past undo changes in side tree view
		keys = {
			{ "<leader>u", ":UndotreeToggle | UndotreeFocus<CR>", desc = "Undo tree toggle", silent = true },
		},
	},

	-- LSP configuration plugins
	"neovim/nvim-lspconfig",
	"folke/neodev.nvim",
	"williamboman/mason.nvim",  -- LSP manager
	"williamboman/mason-lspconfig.nvim",
	"jose-elias-alvarez/null-ls.nvim", -- LSP diagnostics, code actions, formatting
	{
		"j-hui/fidget.nvim", -- LSP loading info
		tag = "legacy"
	}
}
