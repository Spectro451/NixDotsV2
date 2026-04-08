{ config, pkgs, ... }:
{
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    timeout = 15;
    systemd-boot.consoleMode = "max";
  };
}
