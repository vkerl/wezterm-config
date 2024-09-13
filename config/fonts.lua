local wezterm = require("wezterm")
local platform = require("utils.platform")

local M = {}

local font = "JetBrainsMono Nerd Font"
local font_size = platform().is_mac and 12 or 13

function M.apply_to_config(config)
  config.font = wezterm.font(font)
  config.font_size = font_size

  --ref: https://wezfurlong.org/wezterm/config/lua/config/freetype_pcf_long_family_names.html#why-doesnt-wezterm-use-the-distro-freetype-or-match-its-configuration
  config.freetype_load_target = "Normal" ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
  config.freetype_render_target = "Normal" ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
end

return M
