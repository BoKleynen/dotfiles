{
  description = "My dotfiles managed as a nix flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, ... }@inputs:
    let
      system = "aarch64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      homeConfigurations."bokleynen" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          home/home.nix
          home/programs/git.nix
          home/programs/alacritty.nix
          home/programs/zellij.nix
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };

      devShells.aarch64-darwin.default = pkgs.mkShell { buildInputs = [ pkgs.nixfmt-rfc-style ]; };
    };
}
