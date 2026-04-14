{ ... }:
{
  programs.noctalia-shell.plugins = {
    sources = [
      {
        enabled = true;
        name = "Noctalia Plugins";
        url = "https://github.com/noctalia-dev/noctalia-plugins";
      }
    ];
    states = {
      usb-drive-manager = {
        enabled = true;
        sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
      };
    };
    version = 2;
  };

  programs.noctalia-shell.pluginSettings = {
    usb-drive-manager = {
      autoMount = false;
      fileBrowser = "thunar";
      terminalCommand = "kitty";
      showNotifications = true;
      hideWhenEmpty = true;
      showBadge = false;
      iconColor = "none";
    };
  };
}
