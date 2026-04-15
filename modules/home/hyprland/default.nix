{ ... }:
{
  imports = [
    ./look.nix
    ./input.nix
    ./binds.nix
    ./rules.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      source = ~/.config/hypr/noctalia/noctalia-colors.conf
    '';
    settings = {
      monitor = [ ",1920x1080@165,auto,1" ];
      env = [
        "xcursor_size,20"
        "hyprcursor_size,20"
      ];
      exec-once = [
        "noctalia-shell"
        "firefox"
        "obsidian"
        "spotify"
      ];
    };
  };
}
