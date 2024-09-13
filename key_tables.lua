local wezterm = require("wezterm")
local act = wezterm.action

local module = {}

function module.apply_to_config(config)
  config.key_tables = {

    resize_pane = {
      { key = "LeftArrow",  action = act.AdjustPaneSize({ "Left", 1 }) },
      { key = "h",          action = act.AdjustPaneSize({ "Left", 1 }) },

      { key = "RightArrow", action = act.AdjustPaneSize({ "Right", 1 }) },
      { key = "l",          action = act.AdjustPaneSize({ "Right", 1 }) },

      { key = "UpArrow",    action = act.AdjustPaneSize({ "Up", 1 }) },
      { key = "k",          action = act.AdjustPaneSize({ "Up", 1 }) },

      { key = "DownArrow",  action = act.AdjustPaneSize({ "Down", 1 }) },
      { key = "j",          action = act.AdjustPaneSize({ "Down", 1 }) },

      -- Cancel the mode by pressing escape
      { key = "Escape",     action = "PopKeyTable" },
    },

    activate_pane = {
      { key = "LeftArrow",  action = act.ActivatePaneDirection("Left") },
      { key = "h",          action = act.ActivatePaneDirection("Left") },

      { key = "RightArrow", action = act.ActivatePaneDirection("Right") },
      { key = "l",          action = act.ActivatePaneDirection("Right") },

      { key = "UpArrow",    action = act.ActivatePaneDirection("Up") },
      { key = "k",          action = act.ActivatePaneDirection("Up") },

      { key = "DownArrow",  action = act.ActivatePaneDirection("Down") },
      { key = "j",          action = act.ActivatePaneDirection("Down") },

      { key = "q",          action = act.CloseCurrentPane({ confirm = true }) },
    },

    activate_tab = {
      { key = "q", action = act.CloseCurrentTab({ confirm = true }) },
    },
  }
end

return module
