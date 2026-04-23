-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- https://wezterm.org/config/lua/wezterm/target_triple.html
-- run this script 
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  -- if windows
    config.default_prog = { 'C:\\Windows\\System32\\wsl.exe', '--distribution', 'Ubuntu', '--cd', '~' }
    config.default_domain = 'WSL:Ubuntu'
end

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font_size = 16
config.font = wezterm.font('JetBrains Mono' )
config.color_scheme = 'catppuccin-macchiato'


config.enable_tab_bar = false

config.keys = {
  -- CTRL-SHIFT-l activates the debug overlay
  { key = 'L', mods = 'CTRL', action = wezterm.action.ShowDebugOverlay },
}

-- Finally, return the configuration to wezterm:
return config




