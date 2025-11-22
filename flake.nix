{
  # https://nixos.wiki/wiki/Flakes
  description = "My dotfiles managed as a nix flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    # nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

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
      home-manager,
      nixpkgs,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      flake = {
        overlays = import ./overlays { inherit inputs; };

        homeManagerModules = import ./modules/home-manager;

        # work machine
        homeConfigurations."bokleynen" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.aarch64-darwin;

          # Pass additional argument to home.nix
          extraSpecialArgs = {
            inherit (self) inputs outputs;
          };

          # Specify your home configuration modules here, for example,
          # the path to your home.nix.
          modules = [
            home/home.nix

            ./home/programs/atuin.nix
            ./home/programs/alacritty.nix
            ./home/programs/bat.nix
            ./home/programs/delta.nix
            ./home/programs/direnv.nix
            ./home/programs/eza.nix
            ./home/programs/fd.nix
            ./home/programs/gh.nix
            ./home/programs/ghostty.nix
            ./home/programs/git.nix
            ./home/programs/go.nix
            ./home/programs/jujutsu.nix
            ./home/programs/k9s.nix
            ./home/programs/lazygit.nix
            ./home/programs/neovim.nix
            ./home/programs/vscode.nix
            ./home/programs/zellij.nix
            ./home/programs/zsh.nix
          ];
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
