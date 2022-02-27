{
  description = "MacOS configurations";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixpkgs-unstable";
    };

    nur = {
      url = "github:nix-community/NUR";
    };

    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    homemanager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nur, ... }@inputs:
    let
      sharedDarwinConfiguration = { config, pkgs, ... }: {
        nix = {
          package = pkgs.nixFlakes;

          extraOptions = ''
            experimental-features = nix-command flakes
          '';

          binaryCaches = [
            "https://cache.nixos.org"
          ];

          binaryCachePublicKeys = [
            "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
          ];
        };

        nixpkgs = {
          config = {
            allowUnfree = true;
          };

          overlays = [
            self.overlay
            nur.overlay
          ];
        };
      };
    in
    {
      overlay = import ./overlays;

      darwinConfigurations = {
        corvus = inputs.darwin.lib.darwinSystem {
          system = "x86_64-darwin";
          inherit inputs;

          modules = [
            inputs.homemanager.darwinModules.home-manager
            inputs.agenix.nixosModules.age
            sharedDarwinConfiguration
            ./machines/corax
            ./users/elcuervo
          ];
        };
      };

      corvus = self.darwinConfigurations.corvus.system;
    };
}
