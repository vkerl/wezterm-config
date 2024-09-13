local wezterm = require("wezterm")
local fonts = require("config.fonts")
local hyperlink = require("config.hyperlink")
-- local util = require("utils.util")
local gpus = wezterm.gui.enumerate_gpus()

local keybinding = require("config.keybinding")
local key_tables = require("config.key_tables")

---------------------------------------------------------------
--- Config
---------------------------------------------------------------
local config = {}

config.leader = { key = "Space", mods = "CTRL|SHIFT" }

fonts.apply_to_config(config)

-- 主题配色
config.color_scheme_dirs = { "~/.config/wezterm/colors" }
-- config.color_scheme = "Catppuccin Mocha"
config.color_scheme = "Dracula (Official)"

-- 禁止默认的快捷键
config.disable_default_key_bindings = true

-- window
config.window_background_opacity = 0.88
-- config.window_decorations = "NONE"
-- 去掉窗口的原生标题栏
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.initial_cols = 120
config.initial_rows = 24

-- 默认启动的shell程序
config.default_prog = { "nu" }

-- 配置gpu加速
-- for _, gpu in ipairs(wezterm.gui.enumerate_gpus()) do
-- 	if gpu.backend == "Vulkan" and gpu.device_type == "IntegratedGpu" then
-- 		config.webgpu_preferred_adapter = gpu
-- 		config.front_end = "WebGpu"
-- 		break
-- 	end
-- end
config.webgpu_preferred_adapter = gpus[1]
config.front_end = "WebGpu"
config.animation_fps = 60
config.max_fps = 60

keybinding.apply_to_config(config)
key_tables.apply_to_config(config)
hyperlink.apply_to_config(config)

-- wezterm.on("window-config-reloaded", function(_window, _pane)
-- 	wezterm.log_info("the config was reloaded for this window")
-- end)

return config
