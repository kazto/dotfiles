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
cnf.enable_kitty_keyboard = true
cnf.scrollback_lines = 20000

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
   { key = 'd', mods = 'LEADER', action = wez.action.ShowDebugOverlay },
   { key = 'c', mods = 'LEADER', action = wez.action.ActivateCopyMode },
   { key = 'k', mods = 'LEADER', action = wez.action.EmitEvent("toggle-backdrop") },
   {
    key = "y",
    mods = "LEADER",
    action = wez.action_callback(function(window, pane)
      -- コピーモードに入る
      window:perform_action(act.ActivateCopyMode, pane)

      -- 直前のInputゾーン（最後のコマンド）に移動
      window:perform_action(act.CopyMode({ MoveBackwardSemanticZone = "Input" }), pane)

      -- セル選択モードを開始
      window:perform_action(act.CopyMode({ SetSelectionMode = "Cell" }), pane)

      -- 次のPromptゾーンまで選択（コマンドと出力を含む）
      window:perform_action(act.CopyMode({ MoveBackwardSemanticZone = "Prompt" }), pane)

      -- 1行上に移動して行末へ（現在のプロンプト行を除外）
      window:perform_action(act.CopyMode("MoveUp"), pane)
      window:perform_action(act.CopyMode("MoveToEndOfLineContent"), pane)

      -- クリップボードにコピー
      window:perform_action(
        act.Multiple({
          { CopyTo = "ClipboardAndPrimarySelection" },
          { Multiple = { "ScrollToBottom", { CopyMode = "Close" } } },
        }),
        pane
      )

      -- ステータスバーに一時的なステータスを表示
      window:set_right_status("📋 Copied!")
      -- 3秒後にクリア
      wez.time.call_after(3, function()
        window:set_right_status("")
      end)
    end),
  },
}

cnf.key_tables = {
   copy_mode = {
      { key = 'h', mods = 'NONE', action = act.CopyMode 'MoveLeft' },
      { key = 'j', mods = 'NONE', action = act.CopyMode 'MoveDown' },
      { key = 'k', mods = 'NONE', action = act.CopyMode 'MoveUp' }, -- 6
      { key = 'l', mods = 'NONE', action = act.CopyMode 'MoveRight' },
      { key = 'i', mods = 'NONE', action = act.CopyMode({ MoveBackwardZoneOfType = "Input" }) }, -- 1
      { key = 'o', mods = 'NONE', action = act.CopyMode({ MoveBackwardZoneOfType = "Output" }) }, -- 1
      { key = 'p', mods = 'NONE', action = act.CopyMode({ MoveBackwardZoneOfType = "Prompt" }) }, -- 1
      { key = 'b', mods = 'NONE', action = act.CopyMode "MoveBackwardSemanticZone" }, -- 2
      { key = 'f', mods = 'NONE', action = act.CopyMode "MoveForwardSemanticZone" }, -- 5
      { key = 'c', mods = 'NONE', action = act.CopyMode({ SetSelectionMode = "Cell" }) }, -- 3
      { key = 'x', mods = 'NONE', action = act.CopyMode({ SetSelectionMode = "Line" }) }, -- 3
      { key = 'z', mods = 'NONE', action = act.CopyMode({ SetSelectionMode = "Block" }) }, -- 3
      { key = 'I', mods = 'SHIFT', action = act.CopyMode({ MoveForwardZoneOfType = "Input" }) }, -- 4
      { key = 'O', mods = 'SHIFT', action = act.CopyMode({ MoveForwardZoneOfType = "Output" }) }, -- 4
      { key = 'P', mods = 'SHIFT', action = act.CopyMode({ MoveForwardZoneOfType = "Prompt" }) }, -- 4
      { key = 'e', mods = 'NONE', action = act.CopyMode 'MoveToEndOfLineContent' }, -- 7
      { key = 'm', mods = 'NONE', action = act.CopyMode 'MoveToViewportTop' }, -- 7
      { key = 'n', mods = 'NONE', action = act.CopyMode 'MoveToViewportBottom' }, -- 7
      { key = 'q', mods = 'NONE', action = act.CopyMode 'Close' },
   },
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
