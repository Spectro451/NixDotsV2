{lib, ...}: let
  lua = lib.generators.mkLuaInline;
in {
  imports = [
    ./look.nix
    ./input.nix
    ./binds.nix
    ./rules.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
    systemd.enable = false;

    extraConfig = ''
      dofile(os.getenv("HOME") .. "/.config/hypr/noctalia.lua").apply_theme()
    '';

    settings = {
      monitor = [
        {
          output = "";
          mode = "highrr";
          position = "auto";
          scale = "1";
        }
      ];

      env = [
        { _args = [ "xcursor_size" "20" ]; }
        { _args = [ "hyprcursor_size" "20" ]; }
      ];

      on = {
        _args = [
          "hyprland.start"
          (lua ''
            function()
              hl.exec_cmd("noctalia")
            end'')
        ];
      };

      layer_rule = [{
        name = "noctalia";
        match = { namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd|window-switcher)$"; };
        no_anim = true;
        ignore_alpha = 0.5;
        blur = true;
        blur_popups = true;
      }];
    };
  };
}
