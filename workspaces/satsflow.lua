local wezterm = require("wezterm")
local mux = wezterm.mux

-- Satsflow
local function setup_satsflow(args)
	local satsflow_root = wezterm.home_dir .. "/code/work/monstera/satsflow"
	local satsflow_cmd_tab, satsflow_pane, satsflow_window = mux.spawn_window({
		workspace = "satsflow",
		cwd = satsflow_root .. "/api",
		args = args,
	})

	local satsflow_right_pane = satsflow_pane:split({
		direction = "Right",
		size = 0.5,
		cwd = satsflow_root,
	})

	satsflow_pane:split({
		direction = "Top",
		size = 0.5,
		cwd = satsflow_root .. "/api",
	})

	satsflow_right_pane:split({
		direction = "Top",
		size = 0.5,
		cwd = satsflow_root,
	})

	satsflow_cmd_tab:set_title("cmd")

	local satsflow_api_tab, satsflow_api_pane = satsflow_window:spawn_tab({
		cwd = satsflow_root .. "/api",
	})
	satsflow_api_tab:set_title("api")
	satsflow_api_pane:send_text("TERM=wezterm SKIP=all nvim .\n")

	local satsflow_frontend_tab, satsflow_frontend_pane = satsflow_window:spawn_tab({
		cwd = satsflow_root,
	})
	satsflow_frontend_tab:set_title("client")
	satsflow_frontend_pane:send_text("TERM=wezterm SKIP=all nvim .\n")
end

return setup_satsflow
