{ lazyvim, ... }:

let
  colorschemePlugins = builtins.readFile ./colorscheme.lua;
  editorPlugins = builtins.readFile ./editor.lua;
in
{
  imports = [ lazyvim.homeManagerModules.default ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  programs.lazyvim = {
    enable = true;
    plugins = {
      colorscheme = colorschemePlugins;
      editor = editorPlugins;
    };
  };
}
