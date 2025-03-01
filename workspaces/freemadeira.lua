local wezterm = require("wezterm")
local mux = wezterm.mux

-- FREE Madeira workspace
local function setup_freemadeira(args)
	local freemadeira_root = wezterm.home_dir .. "/code/work/free-madeira/website"
	local freemadeira_cmd_tab, freemadeira_pane, freemadeira_window = mux.spawn_window({
		workspace = "free madeira",
		cwd = freemadeira_root,
		args = args,
	})

	local freemadeira_right_pane = freemadeira_pane:split({
		direction = "Right",
		size = 0.5,
		cwd = freemadeira_root,
	})

	freemadeira_pane:split({
		direction = "Top",
		size = 0.5,
		cwd = freemadeira_root,
	})

	freemadeira_right_pane:split({
		direction = "Top",
		size = 0.5,
		cwd = freemadeira_root,
	})

	freemadeira_cmd_tab:set_title("cmd")

	local freemadeira_frontend_tab, freemadeira_frontend_pane = freemadeira_window:spawn_tab({
		cwd = freemadeira_root,
	})
	freemadeira_frontend_tab:set_title("frontend")
	freemadeira_frontend_pane:send_text("TERM=wezterm SKIP=all nvim .\n")
end

return setup_freemadeira
