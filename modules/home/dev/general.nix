{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    gcc
    tree-sitter
    alejandra
    prettierd
    stylua
    opencode
    #docker
  ];
}
