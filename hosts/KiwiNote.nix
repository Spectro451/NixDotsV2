{...}: {
  imports = [./KiwiNote-hardware.nix];
  networking.hostName = "KiwiNote";
  hardware.bluetooth.enable = true;
  # Power management
  powerManagement.enable = true;
  services.tlp = {
    enable = true;
    settings = {
      TLP_WARN_LEVEL = 1;
    };
  };
  services.upower.enable = true;
  # Fingerprint
  services.fprintd.enable = true;
  security.pam.services.sudo.fprintAuth = true;
}
