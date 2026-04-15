{ pkgs, ... }:
{
  gtk = {
    enable = true;
    gtk4.theme = null;
    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
  };
  xfconf.settings = {
    thunar = {
      "last-view" = "ThunarIconView";
      "last-show-hidden" = true;
      "last-icon-view-zoom-level" = "THUNAR_ZOOM_LEVEL_100_PERCENT";
      "misc-single-click" = false;
      "misc-confirm-move-to-trash" = true;
      "misc-show-delete-action" = true;
      "misc-remember-geometry" = true;
      "misc-image-size-in-statusbar" = true;
      "misc-window-title-style" = "THUNAR_WINDOW_TITLE_STYLE_FULL_PATH_WITHOUT_THUNAR_SUFFIX";
    };
    thunar-volman = {
      "automount-drives" = false;
      "automount-media" = false;
      "autorun-on-plug" = false;
    };
  };
}
