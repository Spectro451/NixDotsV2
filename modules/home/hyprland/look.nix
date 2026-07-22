{lib, ...}: let
  lua = lib.generators.mkLuaInline;
in {
  wayland.windowManager.hyprland.settings = {
    config = {
      general = {
        gaps_in = 3;
        gaps_out = 6;
        border_size = 2;
        resize_on_border = true;
        layout = "dwindle";
      };
      decoration = {
        rounding = 7;
        rounding_power = 2;
        active_opacity = 0.95;
        inactive_opacity = 0.85;
        shadow = {
          enabled = true;
          range = 9;
          render_power = 4;
          color = "rgba(734f9aff)";
        };
        blur = {
          enabled = true;
          size = 4;
          passes = 2;
          vibrancy = 0.6;
        };
      };
      animations.enabled = true;
      dwindle.preserve_split = true;
      master.new_status = "master";
      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
        vrr = 2;
      };
      cursor.no_hardware_cursors = true;
    };

    curve = [
      { _args = [ "easeOutQuint"    { type = "bezier"; points = lua "{ {0.23,1},{0.32,1} }"; } ]; }
      { _args = [ "easeinoutcubic"  { type = "bezier"; points = lua "{ {0.65,0.05},{0.36,1} }"; } ]; }
      { _args = [ "linear"          { type = "bezier"; points = lua "{ {0,0},{1,1} }"; } ]; }
      { _args = [ "almostLinear"    { type = "bezier"; points = lua "{ {0.5,0.5},{0.75,1.0} }"; } ]; }
      { _args = [ "quick"           { type = "bezier"; points = lua "{ {0.15,0},{0.1,1} }"; } ]; }
    ];

    animation = [
      { leaf = "global";        enabled = true; speed = 10;   bezier = "default"; }
      { leaf = "border";        enabled = true; speed = 5.39; bezier = "easeOutQuint"; }
      { leaf = "windows";       enabled = true; speed = 4.79; bezier = "easeOutQuint"; }
      { leaf = "windowsIn";     enabled = true; speed = 4.1;  bezier = "easeOutQuint"; style = "popin 87%"; }
      { leaf = "windowsOut";    enabled = true; speed = 1.49; bezier = "linear";       style = "popin 87%"; }
      { leaf = "fadeIn";        enabled = true; speed = 1.73; bezier = "almostLinear"; }
      { leaf = "fadeOut";       enabled = true; speed = 1.46; bezier = "almostLinear"; }
      { leaf = "fade";          enabled = true; speed = 3.03; bezier = "quick"; }
      { leaf = "layers";        enabled = true; speed = 3.81; bezier = "easeOutQuint"; }
      { leaf = "layersIn";      enabled = true; speed = 4;    bezier = "easeOutQuint"; style = "fade"; }
      { leaf = "layersOut";     enabled = true; speed = 1.5;  bezier = "linear";       style = "fade"; }
      { leaf = "fadeLayersIn";  enabled = true; speed = 1.79; bezier = "almostLinear"; }
      { leaf = "fadeLayersOut"; enabled = true; speed = 1.39; bezier = "almostLinear"; }
      { leaf = "workspaces";    enabled = true; speed = 8;    bezier = "easeOutQuint"; style = "slide"; }
      { leaf = "workspacesIn";  enabled = true; speed = 8;    bezier = "easeOutQuint"; style = "slide"; }
      { leaf = "workspacesOut"; enabled = true; speed = 8;    bezier = "easeOutQuint"; style = "slide"; }
    ];
  };
}
