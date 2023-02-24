-- Bottom status bar
local lualine_config = {
  options = {
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    theme = 'dracula-nvim'
  },
  sections = {
    lualine_x = {'encoding', 'filetype'},
  },
}

local function ins_right(component)
  table.insert(lualine_config.sections.lualine_x, component)
end

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

ins_right {
  function()
    local shiftwidth = vim.api.nvim_buf_get_option(0, 'shiftwidth')
    return "" .. " " .. shiftwidth
  end
}

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = lualine_config
}
