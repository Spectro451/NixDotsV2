{ config, pkgs, ... }:
{
  programs.thunar = {
    enable = true;
    plugins = [
      pkgs.thunar-archive-plugin
      pkgs.thunar-volman
    ];
  };
  services.tumbler.enable = true;
}
