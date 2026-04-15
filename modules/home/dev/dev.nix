{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    nodejs_22
    pnpm
    nest-cli

    # Tools
    #postman
    #python3
  ];

  # MySQL
  #services.mysql = {
  #  enable = true;
  #  package = pkgs.mysql80;
  #};

  # PostgreSQL
  #services.postgresql = {
  #  enable = true;
  #};
}
