{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    #android-studio
    #flutter
    #libglvnd
  ];
}
