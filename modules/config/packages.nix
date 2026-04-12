{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nano
    curl
    git
    unzip
    ripgrep
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
  ];

}
