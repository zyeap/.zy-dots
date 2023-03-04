return {
	"nvim-neo-tree/neo-tree.nvim",
	cmd = "Neotree",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{ "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle Neotree" },
	},
	init = function()
		vim.g.neo_tree_remove_legacy_commands = 1
		if vim.fn.argc() == 1 then
			local stat = vim.loop.fs_stat(vim.fn.argv(0))
			if stat and stat.type == "directory" then
				require("neo-tree")
			end
		end
	end,
	opts = {
		close_if_last_window = true,
		enable_git_status = true,
		filesystem = {
			bind_to_cwd = false,
			follow_current_file = true,
		},
		mappings = {
			["<cr>"] = "open_tabnew",
		},
		window = {
			width = 30,
		},
	},
}
