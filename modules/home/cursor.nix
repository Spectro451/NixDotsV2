{ pkgs, ... }:
{
  home.pointerCursor = {
    enable = true;
    name = "kasane-teto-cursors";
    gtk.enable = true;
    package = pkgs.kasane-teto-cursors;
  };
}
