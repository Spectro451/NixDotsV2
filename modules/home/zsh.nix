{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initContent = ''
      clear
      sleep 0.1
      fastfetch
    '';
    shellAliases = {
      ll = "ls -l";
      edit = "sudo -E ranger";
    };
    history.size = 1500;
    history.path = "$HOME/.zsh_history";
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "z" ];
      theme = "agnoster";
    };
  };
}
