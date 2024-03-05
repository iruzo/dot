local wezterm = require("wezterm")

local function get_os()
  local target = wezterm.target_triple
  if string.find(target, "linux") then
    return "linux"
  elseif string.find(target, "darwin") then
    return "macos"
  else
    return "windows"
  end
end

if get_os() == "windows" then
  default_prog = { 'powershell.exe', '-NoLogo' }
  -- default_prog = { 'wsl.exe', '~', '-d', 'Ubuntu-22.04' }
  -- default_domain = 'WSL:Ubuntu-20.04'
end

-- maximize window on startup
local mux = wezterm.mux
wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end

function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    -- return 'Gruvbox dark, hard (base16)'
    -- return 'Batman'
    -- return 'OneDark (base16)'
    return 'DoomOne'
    -- return 'Catppuccin Macchiato'
  else
    return 'Catppuccin Latte'
  end
end

return {
  -- enable_wayland = true,
  window_close_confirmation = 'NeverPrompt',
  audible_bell = 'Disabled',
  -- wezterm.default_wsl_domains()
  default_prog = default_prog,
  -- font = wezterm.font('Red Hat Mono'),
  -- window_background_opacity = 0.6,
  default_domain = default_domain,
  color_scheme = scheme_for_appearance(get_appearance()),
  font_size = 8,
  use_fancy_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,
  disable_default_key_bindings = false,
  keys = {
    { key = 'n', mods = 'CTRL|SHIFT', action = 'DisableDefaultAssignment' },

    { key = 'e', mods = 'CTRL', action = wezterm.action.ClearScrollback 'ScrollbackAndViewport' },

    { key = 'q', mods = 'CTRL|SHIFT', action = wezterm.action.CloseCurrentPane{ confirm = true } },
    { key = 'p', mods = 'CTRL|SHIFT', action = wezterm.action.PasteFrom('Clipboard') },

    { key = 's', mods = 'CTRL|SHIFT', action = wezterm.action.SplitVertical{ domain = 'CurrentPaneDomain' }, },
    { key = 'v', mods = 'CTRL|SHIFT', action = wezterm.action.SplitHorizontal{ domain = 'CurrentPaneDomain' }, },
    { key = 'h', mods = 'CTRL|SHIFT', action = wezterm.action.ActivatePaneDirection('Left') },
    { key = 'j', mods = 'CTRL|SHIFT', action = wezterm.action.ActivatePaneDirection('Down') },
    { key = 'k', mods = 'CTRL|SHIFT', action = wezterm.action.ActivatePaneDirection('Up') },
    { key = 'l', mods = 'CTRL|SHIFT', action = wezterm.action.ActivatePaneDirection('Right') },

    { key = '1', mods = 'CTRL|SHIFT', action = wezterm.action.ActivateTab(0) },
    { key = '2', mods = 'CTRL|SHIFT', action = wezterm.action.ActivateTab(1) },
    { key = '3', mods = 'CTRL|SHIFT', action = wezterm.action.ActivateTab(2) },
    { key = '4', mods = 'CTRL|SHIFT', action = wezterm.action.ActivateTab(3) },
    { key = '5', mods = 'CTRL|SHIFT', action = wezterm.action.ActivateTab(4) },
    { key = '6', mods = 'CTRL|SHIFT', action = wezterm.action.ActivateTab(5) },
    { key = '7', mods = 'CTRL|SHIFT', action = wezterm.action.ActivateTab(6) },
    { key = '8', mods = 'CTRL|SHIFT', action = wezterm.action.ActivateTab(7) },
    { key = '9', mods = 'CTRL|SHIFT', action = wezterm.action.ActivateTab(8) },
    { key = '9', mods = 'CTRL|SHIFT', action = wezterm.action.ActivateTab(9) },
  },
}
