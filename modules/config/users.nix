{ config, pkgs, ... }:
{
  users.users.kiwi = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "Kiwi";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "audio"
    ];
  };

  programs.zsh.enable = true;
  networking.networkmanager.enable = true;
}
