{...}: {
  programs.niri.settings = {
    layout = {
      gaps = 6;
      center-focused-column = "never";
      preset-column-widths = [
        { proportion = 0.33333; }
        { proportion = 0.5; }
        { proportion = 0.66667; }
      ];
      default-column-width = { proportion = 0.5; };
      focus-ring = {
        width = 2;
        active.color = "#7fc8ff";
        inactive.color = "#505050";
      };
      border = {
        enable = false;
        width = 2;
        active.color = "#ffc87f";
        inactive.color = "#505050";
        urgent.color = "#9b0000";
      };
      shadow = {
        enable = true;
        softness = 9;
        spread = 5;
        offset = { x = 0; y = 5; };
        color = "#734f9aff";
      };
      struts = {};
    };

    prefer-no-csd = true;
  };
}