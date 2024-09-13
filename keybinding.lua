local wezterm = require("wezterm")
local act = wezterm.action

local module = {}

function module.apply_to_config(config)
	config.mouse_bindings = {
		-- mouse
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "NONE",
			action = act.CompleteSelection("ClipboardAndPrimarySelection"),
		},
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "CTRL",
			action = act.OpenLinkAtMouseCursor,
		},
	}

	config.keys = {
		{
			key = "r",
			mods = "CTRL|SHIFT",
			action = act.ReloadConfiguration,
		},
		{
			key = "F11",
			mods = "NONE",
			action = act.ToggleFullScreen,
			-- action = wezterm.action_callback(function(window, pane)
			-- 	window:maximize()
			-- end),
		},
		{
			key = "F12",
			mods = "NONE",
			action = act.ShowDebugOverlay,
		},
		{
			key = "P",
			mods = "CTRL",
			action = act.ActivateCommandPalette,
		},

		{ key = "c", mods = "CTRL|SHIFT", action = act({ CopyTo = "Clipboard" }) },
		{ key = "v", mods = "CTRL|SHIFT", action = act({ PasteFrom = "Clipboard" }) },
		{
			key = "z",
			mods = "CTRL",
			action = act.TogglePaneZoomState,
		},

		-- panel
		{
			key = "|",
			mods = "CTRL|SHIFT",
			action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "\\",
			mods = "CTRL",
			action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "w",
			mods = "LEADER",
			action = act.ActivateKeyTable({
				name = "activate_pane",
				timeout_milliseconds = 1000,
			}),
		},
		{ key = "h", mods = "ALT|SHIFT", action = act({ ActivatePaneDirection = "Left" }) },
		{ key = "l", mods = "ALT|SHIFT", action = act({ ActivatePaneDirection = "Right" }) },
		{ key = "k", mods = "ALT|SHIFT", action = act({ ActivatePaneDirection = "Up" }) },
		{ key = "j", mods = "ALT|SHIFT", action = act({ ActivatePaneDirection = "Down" }) },

		-- tab
		{
			key = "t",
			mods = "LEADER",
			action = act.ActivateKeyTable({
				name = "activate_tab",
				timeout_milliseconds = 1000,
			}),
		},
		{ key = "1", mods = "ALT", action = act({ ActivateTab = 0 }) },
		{ key = "2", mods = "ALT", action = act({ ActivateTab = 1 }) },
		{ key = "3", mods = "ALT", action = act({ ActivateTab = 2 }) },
		{ key = "4", mods = "ALT", action = act({ ActivateTab = 3 }) },
		{ key = "5", mods = "ALT", action = act({ ActivateTab = 4 }) },
		{ key = "6", mods = "ALT", action = act({ ActivateTab = 5 }) },
		{ key = "7", mods = "ALT", action = act({ ActivateTab = 6 }) },
		{ key = "8", mods = "ALT", action = act({ ActivateTab = 7 }) },
		{ key = "9", mods = "ALT", action = act({ ActivateTab = 8 }) },
	}
end

return module
