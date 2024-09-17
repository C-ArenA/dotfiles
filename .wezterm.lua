-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration
local config = wezterm.config_builder()

-- Window
config.window_decorations = "RESIZE"
config.window_padding = {
  left = 8,
  right = 8,
  top = 8,
  bottom = 0,
}

-- Colors
config.color_scheme = 'Aurora'
local color_scheme = wezterm.color.get_builtin_schemes()[config.color_scheme]

-- Tabs
config.colors = {
  tab_bar = {
    background = 'rgba(0,0,0, 0.1)',
  }
}
config.use_fancy_tab_bar = false
config.tab_max_width = 20
config.tab_bar_at_bottom = true
-- Background
config.text_background_opacity = 0.8
config.background = {
  {
    source = {
      Color = color_scheme.background
    },
    height = '100%',
    width = '100%',
  },
  {
    source = {
      File = wezterm.home_dir .. '/.dotfiles/assets/olas.png'
    },
    opacity = 0.05
  }
}
print(wezterm.target_triple)
-- Scrolling
config.enable_scroll_bar = true
config.keys = {
  { key = 'DownArrow', mods = 'SHIFT', action = wezterm.action.ScrollByLine(2)},
  { key = 'phys:J', mods = 'ALT', action = wezterm.action.ScrollByLine(2)},
  { key = 'phys:K', mods = 'ALT', action = wezterm.action.ScrollByLine(-2)},
  { key = 'UpArrow', mods = 'SHIFT', action = wezterm.action.ScrollByLine(-2)}
}
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  config.default_prog = {wezterm.executable_dir .. '\\..\\Git\\bin\\bash.exe', '-i', '-l'}
  config.default_cwd = "D:\\Dev"
end

config.launch_menu = {
  {
    label = 'cmd',
    args = { 'cmd' },
    set_environment_variables = { prompt = '$E]7;file://localhost/$P$E\\$E[32m$T$E[0m $E[35m$P$E[36m$_$G$E[0m ' }
  },
  {
    label = 'powershell',
    args = { 'powershell' }
  },
  {
    label = 'brick-calculator',
    cwd = "D:\\Dev\\arena-bricks-calculator"
  }
}
return config
