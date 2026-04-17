{
  pkgs,
  vsExtensions,
  ...
}: {
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
      jnoortheen.nix-ide
      noctalia.noctaliatheme
    ];
    profiles.default.userSettings = {
      "editor.tabSize" = 2;
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
      "editor.formatOnSave" = true;
      "files.autoSave" = "onFocusChange";
      "workbench.iconTheme" = "material-icon-theme";
      "workbench.colorTheme" = "NoctaliaTheme";
      "[nix]"."editor.defaultFormatter" = "jnoortheen.nix-ide";
      "[nix]"."editor.formatOnSave" = true;
      "[javascript]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
      "[typescript]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
      "nix.formatterPath" = "nixfmt";
    };
  };
}
