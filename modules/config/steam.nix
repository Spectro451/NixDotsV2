{pkgs, ...}: {
  boot.kernel.sysctl."vm.max_map_count" = 2147483642;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = [pkgs.libvdpau];
  };

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    remotePlay.openFirewall = true;
  };
  programs.gamemode.enable = true;
}
