{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    userSettings = {
      "files.autoSave" = "off";
      "editor.fontFamily" = "MonoLisa Nerd Font";
      "editor.fontLigatures" = false;
      "editor.fontSize" = 14;
      "editor.fontVariations" = false;
    };
  };
}
