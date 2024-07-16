{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Bo Kleynen";
    userEmail = "kleynenbo@gmail.com";
    ignores = [
      ".DS_STORE"
      ".envrc"
      ".direnv"
      ".idea"
    ];
    includes = [ { path = "~/.gitconfig.local"; } ];
    delta = {
      enable = true;
      options = {
        navigate = true;
        light = false;
        line-numbers = true;
      };
    };
    extraConfig = {
      commit = {
        # TODO: Setup commit signing for non-work related stuff.
        gpgSign = false;
      };
      color = {
        diff = "auto";
        status = "auto";
        branch = "auto";
        ui = true;
      };
      gpg = {
        program = "gpg";
      };
      credential = {
        helper = "osxkeychain";
      };
      pull = {
        rebase = true;
      };
      init = {
        defaultBranch = "main";
      };
      merge = {
        conflictstyle = "diff3";
      };
      diff = {
        colorMoved = "default";
      };
      url."git@github.com:".insteadOf = "https://github.com/";
    };
  };
}
