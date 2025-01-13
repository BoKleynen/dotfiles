{ config, pkgs, ... }:

{
  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      update_check = false;
      keymap_mode = "vim-insert";
      style = "auto";
      inline_height = 0;
      history_filter = [
        "sntrys_"
      ];
    };
  };
}
