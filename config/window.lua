local M = {}

function M.apply_to_config(config)
  config.window_background_opacity = 0.88
  -- config.window_decorations = "NONE"
  -- 去掉窗口的原生标题栏
  config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
  config.initial_cols = 120
  config.initial_rows = 24

  -- config.window_frame = {
  --   border_left_width = "0.5cell",
  --   border_right_width = "0.5cell",
  --   border_bottom_height = "0.25cell",
  --   border_top_height = "0.25cell",
  --   border_left_color = "purple",
  --   border_right_color = "purple",
  --   border_bottom_color = "purple",
  --   border_top_color = "purple",
  -- }
end

return M
