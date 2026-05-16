{...}: {
  programs.niri.settings = {
    window-rules = [
      {
        matches = [{ is-active = false; }];
        opacity = 0.85;
      }
      {
        open-maximized = true;
      }
      {
        geometry-corner-radius = {
          top-left = 7.0;
          top-right = 7.0;
          bottom-left = 7.0;
          bottom-right = 7.0;
        };
        clip-to-geometry = true;
      }
      {
        matches = [{ app-id = ''^org\.wezfurlong\.wezterm$''; }];
        default-column-width = {};
      }
    ];
  };
}