{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initContent = ''
      fastfetch
    '';
    shellAliases = {
      ll = "ls -l";
      edit = "sudo -E ranger";
    };
    history = {
      size = 1500;
    };
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "z"
        "sudo"
        "extract"
      ];
      theme = "agnoster";
    };
  };
}
