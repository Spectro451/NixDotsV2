{lib, ...}: let
  lua = lib.generators.mkLuaInline;

  dsp = {
    exec           = cmd: lua ''hl.dsp.exec_cmd("${cmd}")'';
    close          = lua "hl.dsp.window.close()";
    exit           = lua "hl.dsp.exit()";
    float          = lua ''hl.dsp.window.float({ action = "toggle" })'';
    fullscreen     = lua "hl.dsp.window.fullscreen()";
    pseudo         = lua "hl.dsp.window.pseudo()";
    layout         = msg: lua ''hl.dsp.layout("${msg}")'';
    focus          = dir: lua ''hl.dsp.focus({ direction = "${dir}" })'';
    focusWorkspace = ws:  lua ''hl.dsp.focus({ workspace = "${toString ws}" })'';
    moveToWorkspace= ws:  lua ''hl.dsp.window.move({ workspace = "${toString ws}" })'';
    drag           = lua "hl.dsp.window.drag()";
    resize         = lua "hl.dsp.window.resize()";
  };

  bind     = keys: d:         { _args = [ keys d ]; };
  bindOpts = keys: d: opts:   { _args = [ keys d opts ]; };

  terminal    = "kitty";
  filemanager = "kitty -e yazi";
  workspaceBinds = lib.concatMap (i:
    let key = toString (lib.mod i 10);
    in [
      (bind "SUPER + ${key}"         (dsp.focusWorkspace i))
      (bind "SUPER + SHIFT + ${key}" (dsp.moveToWorkspace i))
    ]
  ) (lib.range 1 10);
in {
  wayland.windowManager.hyprland.settings.bind =
    [
      (bind "SUPER + Q"        (dsp.exec terminal))
      (bind "SUPER + C"         dsp.close)
      (bind "SUPER + SHIFT + M" dsp.exit)
      (bind "SUPER + E"        (dsp.exec filemanager))
      (bind "SUPER + V"         dsp.float)
      (bind "SUPER + R"        (dsp.exec "noctalia msg panel-toggle launcher"))
      (bind "SUPER + P"         dsp.pseudo)
      (bind "SUPER + J"        (dsp.layout "togglesplit"))
      (bind "SUPER + F"         dsp.fullscreen)

      (bind "SUPER + left"  (dsp.focus "l"))
      (bind "SUPER + right" (dsp.focus "r"))
      (bind "SUPER + up"    (dsp.focus "u"))
      (bind "SUPER + down"  (dsp.focus "d"))

      (bind "SUPER + S" (dsp.exec "noctalia msg screenshot-region"))

      (bind "SUPER + mouse_down" (dsp.focusWorkspace "e+1"))
      (bind "SUPER + mouse_up"   (dsp.focusWorkspace "e-1"))

      (bindOpts "SUPER + mouse:272" dsp.drag   { mouse = true; })
      (bindOpts "SUPER + mouse:273" dsp.resize { mouse = true; })

      (bindOpts "XF86AudioRaiseVolume"  (dsp.exec "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+") { locked = true; repeating = true; })
      (bindOpts "XF86AudioLowerVolume"  (dsp.exec "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-")      { locked = true; repeating = true; })
      (bindOpts "XF86AudioMute"         (dsp.exec "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")     { locked = true; })
      (bindOpts "XF86AudioMicMute"      (dsp.exec "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle")   { locked = true; })
      (bindOpts "XF86MonBrightnessUp"   (dsp.exec "brightnessctl -e4 -n2 set 5%+")                  { locked = true; repeating = true; })
      (bindOpts "XF86MonBrightnessDown" (dsp.exec "brightnessctl -e4 -n2 set 5%-")                  { locked = true; repeating = true; })

      (bindOpts "XF86AudioNext"  (dsp.exec "playerctl next")        { locked = true; })
      (bindOpts "XF86AudioPause" (dsp.exec "playerctl play-pause")  { locked = true; })
      (bindOpts "XF86AudioPlay"  (dsp.exec "playerctl play-pause")  { locked = true; })
      (bindOpts "XF86AudioPrev"  (dsp.exec "playerctl previous")    { locked = true; })
    ]
    ++ workspaceBinds;
}
