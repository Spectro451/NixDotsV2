{
  config,
  pkgs,
  ...
}: {
  boot.extraModulePackages = with config.boot.kernelPackages; [v4l2loopback];
  boot.kernelModules = ["v4l2loopback"];
  boot.extraModprobeConfig = ''
    options v4l2loopback exclusive_caps=1 card_label="DroidCam"
  '';

  environment.systemPackages = with pkgs; [
    droidcam
    v4l-utils
  ];

  networking.firewall.allowedTCPPorts = [4747];
  networking.firewall.allowedUDPPorts = [4747];
}
