{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.kiwi.emulation;
in {
  options.kiwi.emulation = {
    steam-rom-manager = lib.mkEnableOption "Steam Rom Manager";
    rmg = lib.mkEnableOption "RMG - Rosalie's Mupen GUI (N64)";
    pcsx2 = lib.mkEnableOption "PCSX2 (PS2)";
    dolphin = lib.mkEnableOption "Dolphin (GameCube / Wii)";
    rpcs3 = lib.mkEnableOption "RPCS3 (PS3)";
  };

  config.home.packages = with pkgs;
    lib.optional cfg.steam-rom-manager steam-rom-manager
    ++ lib.optional cfg.rmg rmg
    ++ lib.optional cfg.pcsx2 pcsx2
    ++ lib.optional cfg.dolphin dolphin-emu
    ++ lib.optional cfg.rpcs3 rpcs3;
}
