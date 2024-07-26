{ config, pkgs, ... }:

{
  programs.k9s = {
    enable = true;
    aliases = { };
    settings = {
      k9s = { };
    };
  };
}
