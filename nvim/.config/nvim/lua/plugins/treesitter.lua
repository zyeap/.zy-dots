return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter-refactor",
	},
	opts = {
		-- A list of parser names, or "all"
		ensure_installed = { "python", "rust", "lua" },

		-- Install parsers synchronously (only applied to `ensure_installed`)
		sync_install = false,

		-- Automatically install missing parsers when entering buffer
		auto_install = true,

		highlight = {
			-- `false` will disable the whole extension
			enable = true,
			indent = { enable = true, disable = { "python" } },
			disable = { "dockerfile", "sql", "markdown" },
			additional_vim_regex_highlighting = false,
		},
		refactor = {
			highlight_definitions = {
				enable = true,
				-- Set to false if you have an `updatetime` of ~100.
				clear_on_cursor_move = true,
			},
			smart_rename = {
				enable = true,
				keymaps = {
					smart_rename = "grr",
				},
			},
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
