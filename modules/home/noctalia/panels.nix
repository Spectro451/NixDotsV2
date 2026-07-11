{...}: {
  programs.noctalia.settings = {
    control_center = {
      hidden_tabs = ["weather"];
      shortcuts = [
        {type = "wifi";}
        {type = "bluetooth";}
        {type = "dark_mode";}
        {type = "notification";}
        {type = "caffeine";}
        {type = "clipboard";}
      ];
    };

    desktop_widgets.enabled = false;

    lockscreen_widgets = {
      enabled = false;
      schema_version = 2;
      widget_order = ["lockscreen-login-box@DP-2"];
      grid = {
        cell_size = 16;
        major_interval = 4;
        visible = true;
      };
      widget."lockscreen-login-box@DP-2" = {
        box_height = 70.0;
        box_width = 400.0;
        cx = 960.0;
        cy = 961.0;
        output = "DP-2";
        rotation = 0.0;
        type = "login_box";
        settings = {
          background_color = "surface_variant";
          background_opacity = 0.88;
          background_radius = 12.0;
          input_opacity = 1.0;
          input_radius = 6.0;
          show_caps_lock = true;
          show_keyboard_layout = true;
          show_login_button = true;
          show_password_hint = true;
        };
      };
    };

    notification = {
      offset_x = 2;
      offset_y = 0;
      scale = 1.0;
    };

    osd = {
      monitors = [];
      position = "top_right";
      position_vertical = "top_right";
      kinds.lock_keys = false;
    };
  };
}
