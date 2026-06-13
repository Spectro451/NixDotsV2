{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./modules/config/boot.nix
    ./modules/config/locale.nix
    ./modules/config/display.nix
    ./modules/config/hyprland.nix
    ./modules/config/users.nix
    ./modules/config/packages.nix
    ./modules/config/sound.nix
    ./modules/config/session-variables.nix
    ./modules/config/steam.nix
    ./modules/config/thunar.nix
    ./modules/config/nh.nix
    ./modules/config/droidcam.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nixpkgs.config.allowUnfree = true;
  services.printing.enable = true;
  system.stateVersion = "26.05";
  services.postgresql = {
    enable = true;
  };
}
