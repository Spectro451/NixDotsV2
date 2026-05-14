{ ... }: {
  programs.niri.settings = {
    spawn-at-startup = [
      { argv = ["noctalia-shell"]; }
      { argv = ["firefox"]; }
      { argv = ["obsidian"]; }
      { argv = ["spotify"]; }
    ];

    layout = {
      border = {
        enable = false;
      };
      focus-ring = {
        width = 2;
      };
    };

    cursor = {
      size = 20;
    };

    prefer-no-csd = true;
  };
}