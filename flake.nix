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
    flake-parts.lib.mkFlake { inherit inputs; } {
      flake = {
        # overlays = import ./overlays { inherit inputs; };

        darwinConfigurations."Bos-Work-MacBook-Pro" = darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          specialArgs = {
            inherit inputs;
          };
          modules = [
            home-manager.darwinModules.home-manager
            ./users/bokleynen/darwin.nix
            {
              system.stateVersion = 5;

              # We install Nix using a separate installer so we don't want nix-darwin
              # to manage it for us. This tells nix-darwin to just use whatever is running.
              nix.useDaemon = true;
              nix = {
                settings.experimental-features = [
                  "nix-command"
                  "flakes"
                ];
              };

              # zsh is the default shell on Mac and we want to make sure that we're
              # configuring the rc correctly with nix-darwin paths.
              programs.zsh.enable = true;
              programs.zsh.shellInit = ''
                # Nix
                if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
                  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
                fi
                # End Nix
              '';
            }
            {
              home-manager.users.bokleynen = import ./users/bokleynen/home.nix;
            }
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
