{...}: {
  programs.noctalia.settings = {
    bar.widgets = {
      background_opacity = 0.93;
      capsule = true;
      center = ["workspaces"];
      end = ["media" "tray" "clock" "caffeine" "battery" "control-center"];
      margin_edge = 4;
      margin_ends = 4;
      padding = 0;
      panel_overlap = 0;
      start = ["launcher" "active_window"];
      thickness = 30;
      widget_spacing = 2;
    };

    widget = {
      active_window = {
        max_length = 360;
        title_scroll = "always";
      };
      launcher.glyph = "send";
      media = {
        max_length = 200;
        title_scroll = "on_hover";
      };
      tray.drawer = true;
    };
  };
}
