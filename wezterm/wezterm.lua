local wez = require('wezterm')
local cnf = wez.config_builder()
local act = wez.action

-- OS detect function ----------------------------------------
local function getOS()
  -- ask LuaJIT first
  if jit then
    return jit.os
  end

  -- Unix, Linux variants
  local fh, err = assert(io.popen("uname -o 2>/dev/null", "r"))
  if fh then
    Osname = fh:read()
  end

  return Osname or "Windows"
end

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
cnf.font_size = 16.0
cnf.audible_bell = 'Disabled'

-- colors ----------------------------------------------------
cnf.colors = {
    background = '#282828',
    ansi = {
        '#242424', -- black
        '#F62B5A', -- red
        '#47B413', -- green
        '#E3C401', -- yellow
        '#24ACD4', -- blue
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
    { key = 'l', mods = 'ALT', action = wez.action.ShowLauncher },
}

-- IME -------------------------------------------------------
cnf.use_ime = true

-- Background Opacity ----------------------------------------
cnf.window_background_opacity = 0.8
if getOS() === "Windows" then
    cnf.win32_system_backdrop = 'Acrylic'
end

return cnf
