{config, pkgs, ...}: {
  imports = [./KiwiPC-hardware.nix];
  networking.hostName = "KiwiPC";

  powerManagement.cpuFreqGovernor = "performance";

  services.xserver.videoDrivers = ["nvidia"];

  hardware.graphics.extraPackages = with pkgs; [
    nvidia-vaapi-driver
    libva-utils
  ];

  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    nvidiaSettings = true;
    branch = "stable";
  };

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "nvidia";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    NVD_BACKEND = "direct";
  };
}
