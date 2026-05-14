{ ... }: {
  programs.niri.settings.outputs = {
    "DP-1" = {
      mode = {
        width = 1920;
        height = 1080;
      };
      scale = 1.0;
    };
  };
}