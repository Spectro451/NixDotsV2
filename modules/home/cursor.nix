{ pkgs, ... }:
{
  home.pointerCursor = {
    name = "kasane-teto-cursors";
    gtk.enable = true;
    package = pkgs.kasane-teto-cursors;
  };
}
