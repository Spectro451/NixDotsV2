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
        {type = "wallpaper";}
      ];
    };

    desktop_widgets.enabled = false;

    lockscreen_widgets = {
      enabled = true;
      schema_version = 2;
      widget_order = [
        "lockscreen-login-box@DP-2"
        "lockscreen-widget-0000000000000001"
        "lockscreen-widget-0000000000000002"
        "lockscreen-widget-0000000000000003"
        "lockscreen-widget-0000000000000004"
      ];
      grid = {
        cell_size = 16;
        major_interval = 4;
        visible = true;
      };
      widget = {
        "lockscreen-login-box@DP-2" = {
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
        lockscreen-widget-0000000000000001 = {
          box_height = 128.0;
          box_width = 464.0;
          cx = 960.0;
          cy = 284.0;
          output = "DP-2";
          rotation = 0.0;
          type = "clock";
          settings = {
            background = true;
            background_opacity = 0.74;
            background_padding = 0;
            center_text = true;
            clock_style = "digital";
            format = "{:%H:%M}";
          };
        };
        lockscreen-widget-0000000000000002 = {
          box_height = 400.0;
          box_width = 288.0;
          cx = 960.0;
          cy = 692.0;
          output = "DP-2";
          rotation = 0.0;
          type = "media_player";
          settings = {
            background = true;
            hide_when_no_media = true;
            layout = "vertical";
            shadow = true;
          };
        };
        lockscreen-widget-0000000000000003 = {
          box_height = 352.0;
          box_width = 448.0;
          cx = 960.0;
          cy = 620.0;
          output = "DP-2";
          rotation = 0.0;
          type = "fancy_audio_visualizer";
          settings = {
            background = false;
            bloom_intensity = 0.45;
            inner_diameter = 1.0;
            ring_opacity = 0.7;
            rotation_speed = 0.3;
            sensitivity = 1.4;
            visualization_mode = "bars_rings";
            wave_thickness = 1.3;
          };
        };
        lockscreen-widget-0000000000000004 = {
          box_height = 48.0;
          box_width = 160.0;
          cx = 960.0;
          cy = 372.0;
          output = "DP-2";
          rotation = 0.0;
          type = "clock";
          settings = {
            clock_style = "digital";
            format = "{:%d-%m-%Y}";
          };
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
      kinds.media = false;
    };
  };
}
