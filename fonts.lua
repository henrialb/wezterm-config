local wezterm = require("wezterm")
local fonts = {}

function fonts.apply_to_config(config)
	config.font_rules = {
		{
			intensity = "Bold",
			italic = false,
			font = wezterm.font({
				family = "JetBrainsMono Nerd Font",
				weight = "Bold",
			}),
		},
		{
			intensity = "Half",
			italic = true,
			font = wezterm.font({
				family = "JetBrainsMono Nerd Font",
				weight = "DemiBold",
				style = "Italic",
			}),
		},
		{
			intensity = "Bold",
			italic = true,
			font = wezterm.font({
				family = "JetBrainsMono Nerd Font",
				weight = "Bold",
				style = "Italic",
			}),
		},
	}
end

return fonts
