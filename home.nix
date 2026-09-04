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
    ./modules/home/noctalia
    ./modules/home/zsh.nix
    ./modules/home/hyprland
    ./modules/home/fastfetch
    ./modules/home/kitty
    ./modules/home/dev
    ./modules/home/cursor.nix
    ./modules/home/editors/vscode.nix
    ./modules/home/editors/nvim
    ./modules/home/zen
    ./modules/home/thunar
    ./modules/home/spotify
    ./modules/home/yazi
    ./modules/home/gtk.nix
    ./modules/home/emulation.nix
  ];

  kiwi.emulation = {
    steam-rom-manager = true;
    rmg = true;
    pcsx2 = true;
    dolphin = false;
    rpcs3 = false;
  };

  programs.vesktop.enable = true;

  home.packages = with pkgs; [
    btop
    brightnessctl
    wl-clipboard
    imv
    libreoffice-qt-stable
    imagemagick
    mpv
    protonup-qt
    obsidian
    pywal
    prismlauncher
    osu-lazer-bin
  ];

  services.syncthing.enable = true;
}
