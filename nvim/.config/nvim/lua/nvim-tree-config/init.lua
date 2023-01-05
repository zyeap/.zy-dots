local list = {
    { key = "t", action = "tabnew" },
    { key = "v", action = "vsplit" },
    { key = "s", action = "split" },
}

require'nvim-tree'.setup {
    view = {
        mappings = {
            list = list
        }
    },
}
