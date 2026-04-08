{ config, pkgs, ... }:
{
  imports = [ ./KiwiPC-hardware.nix ];
  networking.hostName = "KiwiPC";

  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    powerManagement.enable = false;
  };
}
