{...}: {
  wayland.windowManager.hyprland.settings.window_rule = [
    { match = { title = ".*YouTube.*"; };    opacity = "1.0 override 0.85 override 1 override"; }
    { match = { title = ".*Crunchyroll.*"; }; opacity = "1.0 override 0.85 override 1 override"; }
    { match = { title = ".*Netflix.*"; };    opacity = "1.0 override 0.85 override 1 override"; }
    { match = { title = ".*Max.*"; };        opacity = "1.0 override 0.85 override 1 override"; }
    { match = { class = ".*"; };             suppress_event = "maximize"; }
    { match = { class = "^$"; title = "^$"; xwayland = 1; float = 1; fullscreen = 0; }; no_focus = true; }
  ];
}
