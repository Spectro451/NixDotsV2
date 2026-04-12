{ config, pkgs, ... }:
{
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
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nixpkgs.config.allowUnfree = true;
  services.printing.enable = false;
  system.stateVersion = "25.05";
}
