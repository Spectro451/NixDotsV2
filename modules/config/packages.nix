{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nano
    curl
    git
    unzip
    ripgrep
    xarchiver
  ];
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
  ];
  services.udisks2.enable = true;
  services.gvfs.enable = true;
}
