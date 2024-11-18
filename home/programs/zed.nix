{ config, pkgs, ... }:

{
  programs.zed = {
    enable = true;
    settings = {
      vim_mode = true;
      features = {
        inline_completion_provider = "none";
      };
      ui_font_size = 14;
      buffer_font_size = 12;
      buffer_font_family = "MonoLisa Nerd Font";
      theme = {
        mode = "system";
        light = "One Light";
        dark = "One Dark";
      };
    };
  };
}
