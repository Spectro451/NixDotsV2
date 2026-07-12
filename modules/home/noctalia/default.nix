{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.noctalia.homeModules.default
    ./bar.nix
    ./look.nix
    ./panels.nix
    ./plugins.nix
    ./services.nix
    ./user-templates.nix
  ];

  programs.noctalia = {
    enable = true;
    package = inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default;
    systemd.enable = true;
    settings.shell = {
      app_icon_color = "hover";
      avatar_path = "${config.home.homeDirectory}/NixDotsV2/assets/tetoMaid.jpg";
      clipboard_confirm_clear_history = false;
      clipboard_history_max_entries = 50;
      corner_radius_scale = 0.7;
      font_family = "FiraCode Nerd Font";
      lang = "es";
      launch_apps_as_systemd_services = true;
      password_style = "random";
      polkit_agent = true;
      animation.speed = 1.45;
      launcher.session_search = true;
      panel = {
        clipboard_placement = "attached";
        control_center_position = "center";
        open_near_click_clipboard = true;
        open_near_click_control_center = true;
        session_placement = "floating";
        session_position = "center";
      };
      screenshot = {
        save_to_file = true;
        directory = "${config.home.homeDirectory}/Pictures/Screenshots";
        filename_pattern = "%d-%m-%Y-%H%M%S_hyprshot";
      };
      shadow.direction = "center";
    };
  };
}
