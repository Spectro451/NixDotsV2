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

    # API
    #postman

    # Formatters
    nixfmt
    prettierd
  ];

  # Java
  #programs.java = {
  #  enable = true;
  #  package = pkgs.openjdk21;
  #};
}
