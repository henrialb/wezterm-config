local wezterm = require("wezterm")
local mux = wezterm.mux

-- Require the workspace setup modules
local setup_drycut = require("workspaces.drycut")
local setup_aia = require("workspaces.aia")
local setup_satsflow = require("workspaces.satsflow")
local setup_freemadeira = require("workspaces.freemadeira")

-- Workspaces setup when starting wezterm
wezterm.on("gui-startup", function(cmd)
	local args = {}

	if cmd then
		args = cmd.args
	end

	-- Setup each workspace
	setup_drycut(args)
	setup_aia(args)
	setup_satsflow(args)
	setup_freemadeira(args)

	-- Home workspace
	mux.spawn_window({
		workspace = "home",
		cwd = wezterm.home_dir,
		args = args,
	})

	mux.set_active_workspace("home")
end)
