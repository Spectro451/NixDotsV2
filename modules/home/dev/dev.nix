{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    nodejs_22
    pnpm
    nest-cli

    # Tools
    #postman
    #python3
  ];
}
