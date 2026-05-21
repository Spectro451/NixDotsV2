{...}: {
  imports = [
    ./look.nix
    ./input.nix
    ./binds.nix
    ./rules.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    configType = "hyprlang";
    systemd.enable = false;
    extraConfig = ''
      source = ~/.config/hypr/noctalia/noctalia-colors.conf
    '';
    settings = {
      monitor = [",highrr,auto,1"];
      env = [
        "xcursor_size,20"
        "hyprcursor_size,20"
      ];
      exec-once = [
        "noctalia-shell"
      ];
    };
  };
}
