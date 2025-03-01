local wezterm = require("wezterm")
local mux = wezterm.mux

-- Drycut workspace
local function setup_drycut(args)
	local drycut_root = wezterm.home_dir .. "/code/work/drycut/application"
	local cmd_tab, pane, window = mux.spawn_window({
		workspace = "drycut",
		cwd = drycut_root .. "/api",
		args = args,
	})

	-- Maximize window on startup
	window:gui_window():maximize()

	local right_pane = pane:split({
		direction = "Right",
		size = 0.5,
		cwd = drycut_root,
	})

	pane:split({
		direction = "Top",
		size = 0.5,
		cwd = drycut_root .. "/api",
	})

	right_pane:split({
		direction = "Top",
		size = 0.5,
		cwd = drycut_root .. "/frontend",
	})

	cmd_tab:set_title("cmd")

	local api_tab, api_pane = window:spawn_tab({
		cwd = drycut_root .. "/api",
	})
	api_tab:set_title("api")
	api_pane:send_text("TERM=wezterm SKIP=all nvim .\n")

	local frontend_tab, frontend_pane = window:spawn_tab({
		cwd = drycut_root .. "/frontend",
	})
	frontend_tab:set_title("frontend")
	frontend_pane:send_text("TERM=wezterm SKIP=all nvim .\n")
end

return setup_drycut
