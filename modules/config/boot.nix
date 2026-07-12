{pkgs, ...}: {
  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    timeout = 5;
    systemd-boot.consoleMode = "max";
  };
}
