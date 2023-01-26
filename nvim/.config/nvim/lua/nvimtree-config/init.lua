-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local list = {
    { key = "<CR>", action = "tabnew" },
    { key = "v", action = "vsplit" },
    { key = "s", action = "split" },
    { key = "u", action = "dir_up" },
}

require'nvim-tree'.setup {
    view = {
        mappings = {
            list = list
        }
    },
    renderer = {
        icons = {
            show = {
                git = false
            }
        }
    }
}
