{ pkgs, ... }: {
  home.pointerCursor = {
    name = "kasane-teto-cursors";
    size = 24;
    gtk.enable = true;
    package = pkgs.kasane-teto-cursors;
  };
}
