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
    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lazyvim = {
      url = "github:pfassina/lazyvim-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs@{ self, nixpkgs, home-manager, ... }: let
    system = "x86_64-linux";
    kasaneCursorOverlay = final: prev: {
      kasane-teto-cursors = prev.runCommand "kasane-teto-cursor" {} ''
        mkdir -p $out/share/icons
        ln -s ${./assets/cursors/kasane-teto-cursors} $out/share/icons/kasane-teto-cursors
      '';
    };
    mkHost = hostModule:
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          {nixpkgs.overlays = [kasaneCursorOverlay];}
          ./configuration.nix
          hostModule
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.kiwi = import ./home.nix;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.backupFileExtension = "backup";
            home-manager.overwriteBackup = true;
          }
        ];
      };
  in {
    nixosConfigurations = {
      KiwiPC = mkHost ./hosts/KiwiPC.nix;
      KiwiNote = mkHost ./hosts/KiwiNote.nix;
    };
  };
}
