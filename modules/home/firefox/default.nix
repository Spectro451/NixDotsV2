{ pkgs, ... }:
{
  programs.firefox.enable = true;

  programs.firefox.nativeMessagingHosts = [
    pkgs.pywalfox-native
  ];

  home.packages = [
    pkgs.pywalfox-native
  ];
}
