{
  pkgs,
  vsExtensions,
  lib,
  noctalia,
  ...
}:
let
  # El template "code" de Noctalia no se registra en theming.dynamic.toml porque el proceso de deteccion
  # de la extension falla en setups declarativos (Nix). La solucion fue:
  # 1. Copiar la extension a una ubicacion mutable via home.activation
  # 2. Usar un user-template que apunte directamente al theme file de la extension copiada
  noctaliaExt = vsExtensions.vscode-marketplace.noctalia.noctaliatheme;
  extDest = "$HOME/.vscode-oss/extensions/noctalia.noctaliatheme-0.0.5-universal";
in
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
      jnoortheen.nix-ide
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

  home.activation.noctaliaThemeExt = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    rm -rf "${extDest}"
    cp -r ${noctaliaExt}/share/vscode/extensions/noctalia.noctaliatheme "${extDest}"
    chmod -R u+w "${extDest}"
  '';
}
