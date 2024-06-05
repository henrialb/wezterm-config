local wezterm = require("wezterm")
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is mandatory for the pt-PT keyboard layout to work properly on MacOS
-- Where Alt or AltGr + shift + [8 or 9] is used to type { or }
config.send_composed_key_when_left_alt_is_pressed = true

-- config.color_scheme = "catppuccin-mocha"
config.color_scheme = "Jellybeans"
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 12.5
config.bold_brightens_ansi_colors = "BrightAndBold"

config.cursor_blink_rate = 1500
config.default_cursor_style = "SteadyBar"
config.force_reverse_video_cursor = true
config.window_close_confirmation = "AlwaysPrompt"
config.default_workspace = "home"
config.native_macos_fullscreen_mode = true

-- Dim inactive panes
config.inactive_pane_hsb = {
	saturation = 0.5,
	brightness = 0.6,
}

config.window_padding = {
	left = 4,
	right = 4,
	top = 4,
	bottom = 4,
}

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = false
config.status_update_interval = 1000

-- Bring together all configurations
local keys = require("keys")
local colors = require("colors")
local fonts = require("fonts")
require("workspaces")
require("status")
keys.apply_to_config(config)
colors.apply_to_config(config)
fonts.apply_to_config(config)

return config
