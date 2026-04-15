{ config, pkgs, ... }:
{
  imports = [
    ./general.nix
    ./dev.nix
    ./java.nix
    ./android.nix
  ];
}
