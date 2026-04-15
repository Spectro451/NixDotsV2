{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    gcc
    tree-sitter
    nixfmt
    prettierd
    claude-code
    #docker
  ];
}
