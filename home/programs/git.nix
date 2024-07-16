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
    extraConfig = {
      commit = {
        # TODO: Setup commit signing for non-work related stuff.
        gpgSign = false;
      };
      core = {
        pager = "delta";
      };
      interactive = {
        diffFilter = "delta --color-only";
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
      delta = {
        navigate = true;
        light = false;
        line-numbers = true;
      };
      url."git@github.com:".insteadOf = "https://github.com/";
    };
  };
}
