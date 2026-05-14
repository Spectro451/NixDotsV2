{ ... }: {
  programs.niri.settings.input = {
    keyboard.xkb.layout = "latam";
    touchpad = {
      tap = true;
      natural-scroll = false;
    };
    mouse.accel-speed = 0.0;
  };
}