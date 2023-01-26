-- Top bufferline
require('bufferline').setup{
  options = {
    offsets = {
      {
        filetype = "undotree",
        text = "Undotree",
        highlight = "PanelHeading",
        padding = 1,
      },
      {
        filetype = "NvimTree",
        text = "Explorer",
        highlight = "PanelHeading",
        padding = 1,
      },
    }
  }
}

-- Bottom status bar
require('lualine').setup {
  options = {
    component_separators = { left = '', right = ''},
    theme = 'dracula-nvim'
  },
  sections = {
    lualine_x = {'encoding', 'filetype'},
  },
}

-- Gitsigns config
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}
