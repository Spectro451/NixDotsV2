{ pkgs, ... }:
{
  services.xserver.enable = true;
  environment.systemPackages = [ pkgs.kasane-teto-cursors ];
  services.displayManager.sddm = {
    enable = true;
    package = pkgs.kdePackages.sddm;
    wayland = {
      enable = true;
      compositor = "kwin";
    };
    autoNumlock = true;
    settings.Theme = {
      CursorTheme = "kasane-teto-cursors";
      CursorSize = 30;
    };
  };
}
