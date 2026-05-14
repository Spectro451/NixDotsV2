{ ... }: {
  programs.niri.settings.workspaces = {
    "1" = {};
    "2" = {};
    "3" = {};
  };

  programs.niri.settings.window-rules = [
    {
      matches = [{ app-id = "firefox"; }];
      open-on-workspace = "1";
    }
    {
      matches = [{ title = "Obsidian"; }];
      open-on-workspace = "2";
    }
    {
      matches = [{ app-id = "spotify"; }];
      open-on-workspace = "3";
    }
  ];
}