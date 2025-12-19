local wez = require('wezterm')
local cnf = wez.config_builder()
local act = wez.action

-- constants -------------------------------------------------
local win32_system_backdrop = 'Acrylic' -- 'Acrylic' 'Mica' 'Tabbed'
local window_background_opacity = 0.7

-- Toggle Backdrop Event -------------------------------------
wez.on('toggle-backdrop', function(window, _)
	  local overrides = window:get_config_overrides() or {}
	  
	  if overrides.win32_system_backdrop == win32_system_backdrop then
	     overrides.win32_system_backdrop = 'Disable'
	     overrides.window_background_opacity = 0.3
	  else
	     overrides.win32_system_backdrop = win32_system_backdrop
	     overrides.window_background_opacity = window_background_opacity
	  end
	  window:set_config_overrides(overrides)
end)

-- launch menu -----------------------------------------------
cnf.launch_menu = {
   { label = 'wsl', args = { 'wsl.exe' } },
   { label = 'cmd', args = { 'cmd' } },
   { label = 'pwsh', args = { 'pwsh.exe' } },
}

-- fonts -----------------------------------------------------
cnf.font = wez.font_with_fallback({
      {
	 family = "HackGen Console NF",
	 weight = 'Regular',
	 harfbuzz_features = { 'calt=0' },
      },
      "Noto Sans",
})
cnf.font_size = 14.0
cnf.audible_bell = 'Disabled'
cnf.leader = { key = ";", mods = "CTRL" }

-- colors ----------------------------------------------------
cnf.colors = {
   background = '#282828',
   ansi = {
      '#242424', -- black
      '#F62B5A', -- red
      -- '#47B413', -- green
      '#376413',
      '#E3C401', -- yellow
      -- '#24ACD4', -- blue
      '#44ffd4', -- blue
      '#F2AFFD', -- magenta
      '#24C299', -- cyan
      '#E6E6E6', -- white
   },
   brights = {
      '#616161', -- black
      '#FF4D51', -- red
      '#35D450', -- green
      '#E9E836', -- yellow
      '#5DC5F8', -- blue
      '#FEABF2', -- magenta
      '#24DFC4', -- cyan
      '#FFFFFF', -- white
   }
}
-- keybindings -----------------------------------------------
cnf.keys = {
   { key = 'l', mods = 'LEADER', action = wez.action.ShowLauncher },
   { key = 'k', mods = 'LEADER', action = wez.action.EmitEvent("toggle-backdrop") },
}

-- IME -------------------------------------------------------
cnf.use_ime = true

-- Background Opacity ----------------------------------------
cnf.window_background_opacity = window_background_opacity

-- Only Windows ----------------------------------------------
if wez.target_triple == "x86_64-pc-windows-msvc" then
    cnf.win32_system_backdrop = win32_system_backdrop
end

return cnf
