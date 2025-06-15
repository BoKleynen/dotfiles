{ config, pkgs, ... }:
{
  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        name = "Bo Kleynen";
        email = "kleynenbo@gmail.com";
      };
      ui = {
        paginate = "auto";
      };
    };
  };
}
