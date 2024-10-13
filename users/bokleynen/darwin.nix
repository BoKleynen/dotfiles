{ inputs, pkgs, ... }:
{
  users.users.bokleynen = {
    home = "/Users/bokleynen";
    shell = pkgs.zsh;
  };
}
