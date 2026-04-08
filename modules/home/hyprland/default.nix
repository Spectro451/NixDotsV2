{ config, pkgs, ... }:
let
  terminal = "kitty";
  filemanager = "kitty -e sudo -E ranger";
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      #Monitor
      monitor = [ ",preferred,auto,1" ];
      #Start
      exec-once = [
        "noctalia-shell"
        "firefox"
        "obsidian"
        "spotify"
      ];
      windowrule = [
        "workspace 1 silent, match:class ^(firefox)$"
        "workspace 2 silent, match:class ^(obsidian)$"
        "workspace 3 silent, match:class ^(spotify)$"
        "opacity 1.0 override 0.85 override 1 override, match:title .*YouTube.*"
        "opacity 1.0 override 0.85 override 1 override, match:title .*Crunchyroll.*"
        "opacity 1.0 override 0.85 override 1 override, match:title .*Netflix.*"
        "opacity 1.0 override 0.85 override 1 override, match:title .*Max.*"
        "suppress_event maximize, match:class .*"
        "no_focus on, match:class ^$, match:title ^$, match:xwayland 1, match:float 1, match:fullscreen 0"
      ]; 
      #Env
      env = [
        "XCURSOR_SIZE,10"
        "HYPRCURSOR_SIZE,10"
      ];
      #Look and Feel
      general = {
        gaps_in = 2;
        gaps_out = 6;
        border_size = 2;
        #Bordes Eva-01 style
        "col.active_border" = "rgba(965fd4ff) rgba(8bd450ff) 45deg";
        "col.inactive_border" = "rgba(3f6d4eee)";
        resize_on_border = true;
        allow_tearing = true;
        layout = "dwindle";
      };
      #decoration
      decoration = {
        rounding = 7;
        rounding_power = 2;
        active_opacity = 0.90;
        inactive_opacity = 0.85;
        shadow = {
          enabled = true;
          range = 9;
          render_power = 4;
          color = "rgba(734f9aff)";
        };
        blur = {
          enabled = true;
          size = 4;
          passes = 2;
          vibrancy = 0.6;
        };
      };
      #animations
      animations = {
        enabled = true;
        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeinoutcubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];
        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 8, easeOutQuint, slide"
          "workspacesIn, 1, 8, easeOutQuint, slide"
          "workspacesOut, 1, 8, easeOutQuint, slide"
        ];
      };
      #Layout
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
      master = {
        new_status = "master";
      };
      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };
      #Input
      input = {
        #Keyboard
        kb_layout = "latam";
        #Numlock
        numlock_by_default = true;
        #Mouse
        follow_mouse = 1;
        sensitivity = 0;
        #Touchpad
        touchpad = {
          natural_scroll = false;
        };
      };
      #Binds
      bind = [
        #Comunes
        "SUPER, Q, exec, ${terminal}"
        "SUPER, C, killactive"
        "SUPER, M, exit"
        "SUPER, E, exec, ${filemanager}"
        "SUPER, V, togglefloating"
        "SUPER, R, exec, noctalia-shell ipc call launcher toggle"
        "SUPER, P, pseudo"
        "SUPER, J, togglesplit"
        "SUPER, F, fullscreen"
        #Focus
        "SUPER, left, movefocus, l"
        "SUPER, right, movefocus, r"
        "SUPER, up, movefocus, u"
        "SUPER, down, movefocus, d"
        #workspaces
        "SUPER, 1, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER, 5, workspace, 5"
        "SUPER, 6, workspace, 6"
        "SUPER, 7, workspace, 7"
        "SUPER, 8, workspace, 8"
        "SUPER, 9, workspace, 9"
        "SUPER, 0, workspace, 10"
        #MoveWindows
        "SUPER SHIFT, 1, movetoworkspace, 1"
        "SUPER SHIFT, 2, movetoworkspace, 2"
        "SUPER SHIFT, 3, movetoworkspace, 3"
        "SUPER SHIFT, 4, movetoworkspace, 4"
        "SUPER SHIFT, 5, movetoworkspace, 5"
        "SUPER SHIFT, 6, movetoworkspace, 6"
        "SUPER SHIFT, 7, movetoworkspace, 7"
        "SUPER SHIFT, 8, movetoworkspace, 8"
        "SUPER SHIFT, 9, movetoworkspace, 9"
        "SUPER SHIFT, 0, movetoworkspace, 10"
        #ScreenShot
        "SUPER, S, exec, hyprshot -m region"
        "SUPER SHIFT, S, exec, hyprshot -m region"
        #Scroll workspaces
        "SUPER, mouse_down, workspace, e+1"
        "SUPER, mouse_up, workspace, e-1"
      ];
      #MouseBind
      bindm = [
        #Rezise
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
      ];
      #EspecialKey
      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
      ];
      #Multimedia
      bindl = [
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];
    };
  };
}
