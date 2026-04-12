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
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    lazyvim.url = "github:pfassina/lazyvim-nix";
  };
  outputs = { self, nixpkgs, home-manager, noctalia, nix-vscode-extensions, lazyvim, ... }:
  let
    system = "x86_64-linux";
    vsExtensions = nix-vscode-extensions.extensions.${system};
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
            home-manager.extraSpecialArgs = { inherit noctalia vsExtensions lazyvim; };
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
            home-manager.extraSpecialArgs = { inherit noctalia vsExtensions lazyvim; };
            home-manager.backupFileExtension = "backup";
            home-manager.overwriteBackup = true;
          }
        ];
      };
    };
  };
}
