{inputs, ...}: let
  colorschemePlugins = builtins.readFile ./colorscheme.lua;
  editorPlugins = builtins.readFile ./editor.lua;
in {
  imports = [inputs.lazyvim.homeManagerModules.default];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  programs.lazyvim = {
    enable = true;
    pluginSource = "nixpkgs";
    plugins = {
      colorscheme = colorschemePlugins;
      editor = editorPlugins;
    };
  };
}
