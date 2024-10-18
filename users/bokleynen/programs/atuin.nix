{ config, pkgs, ... }:

{
  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      update_check = false;
      keymap_mode = "vim-insert";
      history_filter = [
        "sntrys_"
      ];
    };
  };
}
