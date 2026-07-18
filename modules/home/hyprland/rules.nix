{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      "opacity 1.0 override 0.85 override 1 override, match:title .*YouTube.*"
      "opacity 1.0 override 0.85 override 1 override, match:title .*Crunchyroll.*"
      "opacity 1.0 override 0.85 override 1 override, match:title .*Netflix.*"
      "opacity 1.0 override 0.85 override 1 override, match:title .*Max.*"
      "suppress_event maximize, match:class .*"
      "no_focus on, match:class ^$, match:title ^$, match:xwayland 1, match:float 1, match:fullscreen 0"
    ];
  };
}
