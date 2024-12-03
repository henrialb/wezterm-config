local wezterm = require("wezterm")
local mux = wezterm.mux

-- Workspaces setup when starting wezterm
wezterm.on("gui-startup", function(cmd)
	local args = {}

	if cmd then
		args = cmd.args
	end

	--- Drycut ---
	local drycut_root = wezterm.home_dir .. "/code/work/drycut/application"
	local cmd_tab, pane, window = mux.spawn_window({
		workspace = "drycut",
		cwd = drycut_root .. "/api",
		args = args,
	})

	-- Toggle fullscreen on startup
	window:gui_window():toggle_fullscreen()

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

	--- AIA ---
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

	--- Home ---
	mux.spawn_window({
		workspace = "home",
		cwd = wezterm.home_dir,
		args = args,
	})

	mux.set_active_workspace("home")
end)
