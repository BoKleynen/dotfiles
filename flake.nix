{
  # https://nixos.wiki/wiki/Flakes
  description = "My dotfiles managed as a nix flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    darwin.url = "github:LnL7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";

    zig.url = "github:mitchellh/zig-overlay";
    zig.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      self,
      flake-parts,
      darwin,
      home-manager,
      nixpkgs,
      ...
    }:
    let
      # Overlays is the list of overlays we want to apply from flake inputs.
      overlays = [
        inputs.zig.overlays.default
      ];

      mkSystem = import ./lib/mksystem.nix {
        inherit overlays nixpkgs inputs;
      };
    in
    flake-parts.lib.mkFlake { inherit inputs; } {
      flake = {
        darwinConfigurations."Bos-Work-MacBook-Pro" = mkSystem "Bos-Work-MacBook-Pro" {
          system = "aarch64-darwin";
          user = "bokleynen";
        };
      };
      systems = [ "aarch64-darwin" ];
      perSystem =
        { pkgs, self, ... }:
        {
          # custom packages
          packages = import ./pkgs { inherit pkgs; };

          # shell for working on the home-manager config.
          devShells.default = pkgs.mkShell {
            buildInputs = with pkgs; [
              just
            ];
          };

          formatter = pkgs.nixfmt-rfc-style;
        };
    };
}
