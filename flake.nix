{
  description = "My definitive nix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, noctalia, ... }:
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations = {
      KiwiPC = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit noctalia; };
        modules = [
          ./configuration.nix
          ./hosts/KiwiPC.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.kiwi = import ./home.nix;
            home-manager.extraSpecialArgs = { inherit noctalia; };
          }
        ];
      };
      KiwiNote = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit noctalia; };
        modules = [
          ./configuration.nix
          ./hosts/KiwiNote.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.kiwi = import ./home.nix;
            home-manager.extraSpecialArgs = { inherit noctalia; };
          }
        ];
      };
    };
  };
}
