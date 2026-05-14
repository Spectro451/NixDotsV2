{ ... }: {
  programs.niri.settings.binds = {
    # Comunes
    "Mod+Return".action.spawn = "kitty";
    "Mod+Q".action.close-window = {};
    "Mod+Shift+E".action.quit = {};
    "Mod+V".action.toggle-window-floating = {};

    # Focus
    "Mod+Left".action.focus-column-left = {};
    "Mod+Right".action.focus-column-right = {};
    "Mod+Up".action.focus-window-up = {};
    "Mod+Down".action.focus-window-down = {};

    # Workspaces (1-10)
    "Mod+1".action.focus-workspace = 1;
    "Mod+2".action.focus-workspace = 2;
    "Mod+3".action.focus-workspace = 3;
    "Mod+4".action.focus-workspace = 4;
    "Mod+5".action.focus-workspace = 5;
    "Mod+6".action.focus-workspace = 6;
    "Mod+7".action.focus-workspace = 7;
    "Mod+8".action.focus-workspace = 8;
    "Mod+9".action.focus-workspace = 9;
    "Mod+0".action.focus-workspace = 10;

    # Mover ventanas entre workspaces
    "Mod+Ctrl+1".action.move-column-to-workspace = 1;
    "Mod+Ctrl+2".action.move-column-to-workspace = 2;
    "Mod+Ctrl+3".action.move-column-to-workspace = 3;
    "Mod+Ctrl+4".action.move-column-to-workspace = 4;
    "Mod+Ctrl+5".action.move-column-to-workspace = 5;
    "Mod+Ctrl+6".action.move-column-to-workspace = 6;
    "Mod+Ctrl+7".action.move-column-to-workspace = 7;
    "Mod+Ctrl+8".action.move-column-to-workspace = 8;
    "Mod+Ctrl+9".action.move-column-to-workspace = 9;
    "Mod+Ctrl+0".action.move-column-to-workspace = 10;

    # Media keys
    "XF86AudioRaiseVolume".action.spawn = ["wpctl" "set-volume" "-l" "1" "@DEFAULT_AUDIO_SINK@" "5%+"];
    "XF86AudioLowerVolume".action.spawn = ["wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%-"];
    "XF86AudioMute".action.spawn = ["wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle"];
    "XF86AudioMicMute".action.spawn = ["wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle"];
    "XF86MonBrightnessUp".action.spawn = ["brightnessctl" "-e4" "-n2" "set" "5%+"];
    "XF86MonBrightnessDown".action.spawn = ["brightnessctl" "-e4" "-n2" "set" "5%-"];

    # Screenshot (Niri built-in)
    "Mod+S".action.screenshot = {};

    # Launcher
    "Mod+R".action.spawn = ["noctalia-shell" "ipc" "call" "launcher" "toggle"];
  };
}