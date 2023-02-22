return {
	"akinsho/bufferline.nvim",
	opts = {
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
			},
			indicator = {
				style = "none",
			},
			show_tab_indicators = false,
			show_buffer_close_icons = false,
			show_close_icon = false,
			always_show_bufferline = false,
		},
	},
}
