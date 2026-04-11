{ pkgs, ... }: 
{
  home.pointerCursor = {
    name = "kasane-teto-cursors";
    size = 28;
    gtk.enable = true;
    package = pkgs.kasane-teto-cursors;
  };
}
