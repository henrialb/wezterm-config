local wezterm = require("wezterm")

wezterm.on("update-status", function(window)
	-- Workspace name
	local stat = window:active_workspace()
	local stat_color = "#bb9af7"

	-- It's a little silly to have workspace name all the time
	-- Utilize this to display LDR or current key table name
	if window:active_key_table() then
		stat = window:active_key_table()
		stat_color = "#7dcfff"
	end

	if window:leader_is_active() then
		stat = "LDR"
		stat_color = "#88c422"
	end

	-- Current working directory
	-- local basename = function(s)
	--   -- Nothing a little regex can't fix
	--   return string.gsub(s, "(.*[/\\])(.*)", "%2")
	-- end
	-- CWD and CMD could be nil (e.g. viewing log using Ctrl-Alt-l). Not a big deal, but check in case
	-- local cwd = pane:get_current_working_dir()
	-- cwd = cwd and basename(cwd) or ""
	-- Current command
	-- local cmd = pane:get_foreground_process_name()
	-- cmd = cmd and basename(cmd) or ""

	-- Time
	-- local time = wezterm.strftime("%H:%M")

	-- Left status (left of the tab line)
	window:set_left_status(wezterm.format({
		{ Foreground = { Color = stat_color } },
		{ Text = "  " },
		{ Text = wezterm.nerdfonts.oct_table .. "  " .. stat },
		{ Text = " |" },
	}))
end)

wezterm.on("update-right-status", function(window, pane)
	-- Current working directory
	local basename = function(s)
		return string.gsub(s, "(.*[/\\])(.*)", "%2")
	end

	-- CWD and CMD could be nil (e.g. viewing log using Ctrl-Alt-l)
	local cwd_uri = pane:get_current_working_dir()
	local cwd = ""

	if cwd_uri then
		if type(cwd_uri) == "userdata" then
			cwd = cwd_uri.file_path
		end
	end

	-- Current command
	local cmd = pane:get_foreground_process_name()
	cmd = cmd and basename(cmd) or ""

	local time = wezterm.strftime("%H:%M")

	window:set_right_status(wezterm.format({
		-- Wezterm has a built-in nerd fonts
		-- https://wezfurlong.org/wezterm/config/lua/wezterm/nerdfonts.html
		{ Text = wezterm.nerdfonts.md_folder .. " " .. cwd },
		{ Text = " | " },
		{ Foreground = { Color = "#e0af68" } },
		{ Text = wezterm.nerdfonts.fa_code .. "  " .. cmd },
		"ResetAttributes",
		{ Text = " | " },
		{ Text = wezterm.nerdfonts.md_clock .. "  " .. time },
		{ Text = "  " },
	}))
end)
