{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Bo Kleynen";
    userEmail = "kleynenbo@gmail.com";
    ignores = [
      ".DS_STORE"
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
      core = {
        compression = 9;
        whitespace = "error";
        preloadindex = true;
      };
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
      push = {};
      pull = {
        default = "current";
        rebase = true;
      };
      init = {
        defaultBranch = "main";
      };
      rebase = {
        autoStash = true;
      };
      merge = {
        conflictstyle = "diff3";
      };
      status = {
        branch = true;
      };
      diff = {
        colorMoved = "default";
      };
      url."git@github.com:".insteadOf = "https://github.com/";
    };
  };
}
