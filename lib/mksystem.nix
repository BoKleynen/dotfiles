{
  nixpkgs,
  overlays,
  inputs,
}:
name:
{
  system,
  user,
}:
inputs.darwin.lib.darwinSystem {
  inherit system;
  specialArgs = {
    inherit inputs;
  };
  modules = [
    # Apply our overlays. Overlays are keyed by system type so we have
    # to go through and apply our system type. We do this first so
    # the overlays are available globally.
    { nixpkgs.overlays = overlays; }

    # Allow unfree packages.
    { nixpkgs.config.allowUnfree = true; }

    ../machines/gs.nix
    ../users/${user}/darwin.nix
    inputs.home-manager.darwinModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.bokleynen = ../users/${user}/home.nix;
    }
  ];
}
