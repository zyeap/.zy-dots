require'lualine'.setup {
    options = {
        component_separators = { left = '', right = ''},
        theme = 'dracula-nvim'
    },
	sections = {
		lualine_x = {'encoding', 'filetype'},
	},
}
