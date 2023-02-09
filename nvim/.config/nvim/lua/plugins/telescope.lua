return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  branch = "0.1.x",
  keys = {
    {'<leader>f', '<CMD>Telescope find_files theme=dropdown<CR>', desc = "find files"},
    {'<leader>s', '<CMD>Telescope live_grep theme=dropdown<CR>', desc = "find string"},
    {'<leader>gc', '<CMD>Telescope git_commits theme=dropdown<CR>', desc = "find commits"},
    {'<leader>gb', '<CMD>Telescope git_branches theme=dropdown<CR>', desc = "find branches"},
    {'<leader>gs', '<CMD>Telescope git_status theme=dropdown<CR>', desc = "find git status"},
  },
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  opts = {
    defaults = {
      file_ignore_patterns = {
        "node_modules",
        "venv",
        "__pycache__"
      }
    }
  }
}
