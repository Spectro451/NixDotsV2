{ pkgs, vsExtensions, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    profiles.default.extensions = with vsExtensions.open-vsx; [
      esbenp.prettier-vscode
      pkief.material-icon-theme
      aaron-bond.better-comments
      christian-kohler.path-intellisense
      usernamehw.errorlens
      eamodio.gitlens
      adpyke.codesnap
      ritwickdey.liveserver
      formulahendry.auto-rename-tag
      unthrottled.doki-theme
    ];

    profiles.default.userSettings = {
      "editor.tabSize" = 2;
      "editor.formatOnFocusChange" = true;
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
      "editor.formatOnSave" = true;
      "workbench.iconTheme" = "material-icon-theme";
      "workbench.colorTheme"= "5412c41d-f76b-4488-85a7-1ae1a63bbfcc";
    };
  };
}
