{...}: {
  programs.noctalia.settings = {
    brightness.sync_all_monitors = true;

    dock.enabled = false;

    system.monitor.cpu_usage_activity_threshold = 60;

    weather.enabled = false;

    hooks.colors_changed = "hyprctl reload";
  };
}
