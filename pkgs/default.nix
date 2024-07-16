{ pkgs, ... }:
{
  arcanist = pkgs.callPackage ./arcanist/default.nix { };
}
