{ config, pkgs, ... }:

{
  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    git = true;
    extraOptions = [ ];
  };
}
