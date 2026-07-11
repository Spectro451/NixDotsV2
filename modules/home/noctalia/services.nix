{...}: {
  programs.noctalia.settings = {
    brightness.sync_all_monitors = true;

    dock = {
      active_monitor_only = true;
      auto_hide = true;
      cross_axis_padding = 0;
      enabled = true;
      icon_size = 36;
      item_spacing = 4;
      main_axis_padding = 5;
      monitors = [];
      pinned = ["firefox" "vesktop" "spotify"];
      position = "left";
      radius = 8;
      reserve_space = false;
      show_dots = true;
    };

    system.monitor.cpu_usage_activity_threshold = 60;

    weather.enabled = false;
  };
}
