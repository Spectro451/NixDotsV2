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
    ./modules/home/dev
    ./modules/home/cursor.nix
    ./modules/home/editors/vscode.nix
    ./modules/home/editors/nvim
    ./modules/home/firefox
    ./modules/home/thunar
  ];

  programs.noctalia-shell = {
    enable = true;
  };
  programs.vesktop.enable = true;

  home.packages = with pkgs; [
    btop
    discord
    hyprshot
    brightnessctl
    wl-clipboard
    imv
    spotify
    libreoffice-qt6-fresh
    imagemagick
    mpv
    protonup-qt
    obsidian
  ];

  home.file = {
    ".config/ranger/rifle.conf".source = ./modules/home/ranger/rifle.conf;
    ".config/fastfetch/logo/punpun.png".source = ./modules/home/fastfetch/logo/punpun.png;
  };

  services.syncthing.enable = true;
}
