{
  pkgs,
  inputs,
  ...
}: let
  spicepkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in {
  imports = [inputs.spicetify-nix.homeManagerModules.spicetify];
  programs.spicetify = {
    enable = true;
    theme = spicepkgs.themes.comfy;
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
