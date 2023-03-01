return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  branch = "0.1.x",
  keys = {
    {'<leader>ff', '<CMD>Telescope find_files <CR>', desc = "find files"},
    {'<leader>fs', '<CMD>Telescope live_grep <CR>', desc = "find string"},
    {'<leader>fb', '<CMD>Telescope file_browser <CR>', desc = "file browser"},
    {'<leader>gc', '<CMD>Telescope git_commits <CR>', desc = "find commits"},
    {'<leader>gb', '<CMD>Telescope git_branches <CR>', desc = "find branches"},
    {'<leader>gs', '<CMD>Telescope git_status <CR>', desc = "find git status"},
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim"
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
  })
  end
}
