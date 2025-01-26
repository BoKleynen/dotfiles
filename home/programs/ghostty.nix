{ config, pkgs, ... }:

{
  programs.ghostty = {
    enable = false;
    package = null;
    settings = {
      theme = "rose-pine";
      font-family = "MonoLisa Nerd Font";
      font-size = 12;
    };
  };
}
