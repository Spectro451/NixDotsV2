{config, ...}: {
  # nh os switch - sudo nixos-rebuild switch --flake
  # nh clean - nix-collect-garbage
  # sudo nix-store --optimise

  programs.nh = {
    enable = true;
    flake = "${config.users.users.kiwi.home}/NixDotsV2";
  };

  nix.optimise.automatic = false;
}
