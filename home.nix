{
  config,
  pkgs,
  inputs,
  ...
}: {
  home.username = "kiwi";
  home.homeDirectory = "/home/kiwi";
  home.stateVersion = "26.05";

  imports = [
    ./modules/home/noctalia/noctalia.nix
    ./modules/home/zsh.nix
    ./modules/home/hyprland
    ./modules/home/fastfetch
    ./modules/home/kitty
    ./modules/home/dev
    ./modules/home/cursor.nix
    ./modules/home/editors/vscode.nix
    ./modules/home/editors/nvim
    ./modules/home/firefox
    ./modules/home/thunar
    ./modules/home/spotify
    ./modules/home/yazi
    ./modules/home/gtk.nix
  ];

  programs.vesktop.enable = true;

  home.packages = with pkgs; [
    btop
    hyprshot
    brightnessctl
    wl-clipboard
    imv
    libreoffice-qt6-fresh
    imagemagick
    mpv
    protonup-qt
    obsidian
    pywal
    prismlauncher
  ];

  home.file = {
    ".config/fastfetch/logo/punpun.png".source = ./modules/home/fastfetch/logo/punpun.png;
  };

  services.syncthing.enable = true;
}
