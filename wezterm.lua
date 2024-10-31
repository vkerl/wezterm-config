local wezterm = require("wezterm")
local fonts = require("config.fonts")
local hyperlink = require("config.hyperlink")
local win = require("config.window")
local utils_platform = require("utils.platform")
local gpus = wezterm.gui.enumerate_gpus()

local keybinding = require("config.keybinding")
local key_tables = require("config.key_tables")

---------------------------------------------------------------
--- Config
---------------------------------------------------------------
local config = {}

config.leader = { key = "Space", mods = "CTRL|SHIFT" }

-- 主题配色
config.color_scheme_dirs = { "~/.config/wezterm/colors" }
-- config.color_scheme = "Catppuccin Mocha"
config.color_scheme = "Dracula (Official)"

-- 禁止默认的快捷键
config.disable_default_key_bindings = true

-- window

-- 默认启动的shell程序
if not utils_platform().is_win then
    config.default_prog = { "/usr/local/bin/nu" }
else
    config.default_prog = { "nu" }
end

-- 配置gpu加速
config.webgpu_preferred_adapter = gpus[1]
config.front_end = "WebGpu"
config.animation_fps = 60
config.max_fps = 60

win.apply_to_config(config)
fonts.apply_to_config(config)
keybinding.apply_to_config(config)
key_tables.apply_to_config(config)
hyperlink.apply_to_config(config)

return config
