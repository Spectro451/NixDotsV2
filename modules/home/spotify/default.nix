{
  pkgs,
  spicetify-nix,
  ...
}: let
  spicepkgs = spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in {
  imports = [spicetify-nix.homeManagerModules.spicetify];
  programs.spicetify = {
    enable = true;
    theme = spicepkgs.themes.defaultDynamic;
    enabledExtensions = with spicepkgs.extensions; [
      adblock
      hidePodcasts
      shuffle
      beautifulLyrics
      volumePercentage
      playingSource
      coverAmbience
      showQueueDuration
      sortPlay
      fullAppDisplay
      autoVolume
      betterGenres
    ];
    enabledCustomApps = with spicepkgs.apps; [
      lyricsPlus
      betterLibrary
    ];
  };
}
