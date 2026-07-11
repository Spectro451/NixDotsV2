{config, ...}: {
  programs.noctalia.settings = {
    theme = {
      builtin = "Rosé Pine";
      community_palette = "ADW";
      mode = "dark";
      source = "wallpaper";
      wallpaper_scheme = "faithful";
      templates = {
        builtin_ids = ["gtk3" "gtk4" "hyprland" "kitty"];
        community_ids = ["spicetify" "pywalfox" "neovim" "vscode" "discord" "papirus-icons" "steam" "yazi"];
      };
    };

    wallpaper = {
      directory = "${config.home.homeDirectory}/NixDotsV2/assets/Wallpapers/";
      enabled = true;
      transition = ["fade"];
      transition_duration = 800;
      transition_on_startup = true;
      automation = {
        enabled = true;
        interval_seconds = 1200;
      };
      default.path = "${config.home.homeDirectory}/NixDotsV2/assets/Wallpapers/wallhaven_je9jop.jpg";
      last.path = "${config.home.homeDirectory}/NixDotsV2/assets/Wallpapers/wallhaven_je9jop.jpg";
      monitors."DP-2".path = "${config.home.homeDirectory}/NixDotsV2/assets/Wallpapers/wallhaven_je9jop.jpg";
    };
  };
}
