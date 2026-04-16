{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    gcc
    tree-sitter
    alejandra
    prettierd
    claude-code
    #docker
  ];
}
