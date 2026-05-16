{...}: {
  programs.niri.settings = {
    input = {
      keyboard = {
        xkb.layout = "latam";
        numlock = true;
      };
      touchpad = {
        tap = true;
        natural-scroll = true;
      };
    };
    cursor.size = 20;
  };
}