{
  description = "My dotfiles managed as a nix flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    # nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      self,
      flake-parts,
      home-manager,
      nixpkgs,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      flake = {
        overlays = import ./overlays { inherit inputs; };

        homeManagerModules = import ./modules/home-manager;
        homeConfigurations."bokleynen" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.aarch64-darwin;

          # Pass additional argument to home.nix
          extraSpecialArgs = {
            inherit (self) inputs outputs;
          };

          # Specify your home configuration modules here, for example,
          # the path to your home.nix.
          modules = [ home/home.nix ];
        };

      };
      systems = [ "aarch64-darwin" ];
      perSystem =
        { pkgs, self, ... }:
        {
          packages = import ./pkgs { inherit pkgs; };
        };
    };
}
