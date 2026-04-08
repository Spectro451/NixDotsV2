# modules/home/dev.nix
{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    # General
    gcc
    tree-sitter

    # Frontend
    nodejs_22
    pnpm

    # Backend
    #openjdk21
    #kotlin
    #maven
    nest-cli

    # Android
    #android-studio
    #libglvnd

    # API Testing
    #postman
  ];

  # Java
  #programs.java = {
  #  enable = true;
  #  package = pkgs.openjdk21;
  #};

  # Editor
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      esbenp.prettier-vscode
      pkief.material-icon-theme
    ];
  };
}
