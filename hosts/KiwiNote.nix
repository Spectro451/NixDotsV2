{...}: {
  imports = [./KiwiNote-hardware.nix];
  networking.hostName = "KiwiNote";
  hardware.bluetooth.enable = true;
  # Power management
  powerManagement.enable = true;
  services.tlp.enable = true;
  systemd.services.tlp.serviceConfig = {
    StandardOutput = "null";
    StandardError = "null";
  };
  services.upower.enable = true;
  # Fingerprint
  services.fprintd.enable = true;
  security.pam.services.sudo.fprintAuth = true;
}
