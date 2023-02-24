return {
  "nvim-telescope/telescope.nvim",
  lazy = true,
  cmd = "Telescope",
  branch = "0.1.x",
  keys = {
    {'<leader>ff', '<CMD>Telescope find_files theme=dropdown<CR>', desc = "find files"},
    {'<leader>fs', '<CMD>Telescope live_grep theme=dropdown<CR>', desc = "find string"},
    {'<leader>fb', '<CMD>Telescope file_browser theme=dropdown<CR>', desc = "file browser"},
    {'<leader>gc', '<CMD>Telescope git_commits theme=dropdown<CR>', desc = "find commits"},
    {'<leader>gb', '<CMD>Telescope git_branches theme=dropdown<CR>', desc = "find branches"},
    {'<leader>gs', '<CMD>Telescope git_status theme=dropdown<CR>', desc = "find git status"},
  },
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  config = function()
    require("telescope").setup({
    defaults = {
      file_ignore_patterns = {
        "node_modules",
        "venv",
        "__pycache__"
      }
    },
    extensions = {
      file_browser = {
        hijack_netrw = true,
      }
    }
  })
  require("telescope").load_extension("file_browser")
  end
}
