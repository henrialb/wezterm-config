local wezterm = require("wezterm")
local mux = wezterm.mux

-- An Island Apart workspace
local function setup_aia(args)
	local aia_root = wezterm.home_dir .. "/code/work/an-island-apart/aia-booking"
	local aia_cmd_tab, aia_pane, aia_window = mux.spawn_window({
		workspace = "an island apart",
		cwd = aia_root .. "/api",
		args = args,
	})

	local aia_right_pane = aia_pane:split({
		direction = "Right",
		size = 0.5,
		cwd = aia_root,
	})

	aia_pane:split({
		direction = "Top",
		size = 0.5,
		cwd = aia_root .. "/api",
	})

	aia_right_pane:split({
		direction = "Top",
		size = 0.5,
		cwd = aia_root .. "/frontend",
	})

	aia_cmd_tab:set_title("cmd")

	local aia_api_tab, aia_api_pane = aia_window:spawn_tab({
		cwd = aia_root .. "/api",
	})
	aia_api_tab:set_title("api")
	aia_api_pane:send_text("TERM=wezterm SKIP=all nvim .\n")

	local aia_frontend_tab, aia_frontend_pane = aia_window:spawn_tab({
		cwd = aia_root .. "/frontend",
	})
	aia_frontend_tab:set_title("frontend")
	aia_frontend_pane:send_text("TERM=wezterm SKIP=all nvim .\n")
end

return setup_aia
