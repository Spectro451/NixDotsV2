{
  description = "my definitive nix";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
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
    kasaneCursorOverlay = final: prev: {
      kasane-teto-cursors = prev.runCommand "kasane-teto-cursor" {} ''
        mkdir -p $out/share/icons
        ln -s ${./assets/cursors/kasane-teto-cursors} $out/share/icons/kasane-teto-cursors
      '';
    };
  in {
    nixosConfigurations = {
      KiwiPC = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit noctalia; };
        modules = [
          { nixpkgs.overlays = [ kasaneCursorOverlay ]; }
          ./configuration.nix
          ./hosts/KiwiPC.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.kiwi = import ./home.nix;
            home-manager.extraSpecialArgs = { inherit noctalia; };
            home-manager.backupFileExtension = "backup";
            home-manager.overwriteBackup = true;
          }
        ];
      };
      KiwiNote = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit noctalia; };
        modules = [
          { nixpkgs.overlays = [ kasaneCursorOverlay ]; }
          ./configuration.nix
          ./hosts/KiwiNote.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.kiwi = import ./home.nix;
            home-manager.extraSpecialArgs = { inherit noctalia; };
            home-manager.backupFileExtension = "backup";
            home-manager.overwriteBackup = true;
          }
        ];
      };
    };
  };
}
