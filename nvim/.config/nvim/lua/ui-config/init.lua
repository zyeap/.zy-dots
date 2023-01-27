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
local lualine_config = {
  options = {
    component_separators = { left = '', right = ''},
    theme = 'dracula-nvim'
  },
  sections = {
    lualine_x = {'encoding', 'filetype'},
  },
}

-- Helper function for lualine
local function ins_right(component)
  table.insert(lualine_config.sections.lualine_x, component)
end

-- LSP info for lualine
ins_right {
  function()
    local msg = '[LSP Inactive]'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= 1 then
        return string.format("[%s]", client.name)
      end
    end
    return msg
  end,
  color = { fg = '#ffffff', gui = 'bold' },
}

require('lualine').setup(lualine_config)

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
