{...}: let
  vars = import ./variables.nix;
in {
  imports = [
    ./look.nix
    ./input.nix
    ./binds.nix
    ./rules.nix
  ];

  programs.niri.settings = {
    spawn-at-startup = [
      { argv = ["noctalia-shell"]; }
      { argv = [vars.browser]; }
      { argv = [vars.editor]; }
      { argv = [vars.music]; }
    ];

    screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";
  };
}