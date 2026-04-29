{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    nano
    curl
    git
    unzip
    p7zip
    unrar
    ripgrep
    xarchiver
  ];
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    noto-fonts-cjk-sans
  ];
  services = {
    udisks2.enable = true;
    gvfs.enable = true;
    tailscale.enable = true;
  };
}
