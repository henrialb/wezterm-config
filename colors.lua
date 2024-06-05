local colors = {}

function colors.apply_to_config(config)
	config.colors = {
		cursor_bg = "#c4f036",
		cursor_fg = "#115511",
		tab_bar = {
			background = "#0b0022",

			active_tab = {
				bg_color = "#2b2042",
				fg_color = "#e0e0e0",

				intensity = "Bold",
			},

			inactive_tab = {
				bg_color = "#1b1032",
				fg_color = "#808080",
			},

			inactive_tab_hover = {
				bg_color = "#2b2042",
				fg_color = "#c0c0c0",
			},

			new_tab = {
				bg_color = "#1b1032",
				fg_color = "#808080",

				intensity = "Bold",
			},
			new_tab_hover = {
				bg_color = "#2b2042",
				fg_color = "#c0c0c0",

				intensity = "Bold",
			},
		},
	}
end

return colors
