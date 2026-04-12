{
  config,
  pkgs,
  noctalia,
  lazyvim,
  ...
}:
{
  home.username = "kiwi";
  home.homeDirectory = "/home/kiwi";
  home.stateVersion = "25.05";

  imports = [
    ./modules/home/noctalia/noctalia.nix
    ./modules/home/zsh.nix
    ./modules/home/hyprland
    ./modules/home/fastfetch
    ./modules/home/kitty
    ./modules/home/ranger
    ./modules/home/dev.nix
    ./modules/home/cursor.nix
    ./modules/home/editors/vscode.nix
    ./modules/home/editors/nvim
  ];

  programs.noctalia-shell = {
    enable = true;
  };

  home.packages = with pkgs; [
    ranger
    btop
    discord
    fastfetch
    hyprshot
    brightnessctl
    wl-clipboard
    imv
    spotify
    libreoffice-qt6-fresh
    imagemagick
    mpv
    protonup-qt
    syncthing
    obsidian
    thunar
  ];

  home.file = {
    ".config/ranger/rifle.conf".source = ./modules/home/ranger/rifle.conf;
    ".config/fastfetch/logo/punpun.png".source = ./modules/home/fastfetch/logo/punpun.png;
  };

  services.syncthing.enable = true;
}
