{ config, pkgs, ... }:

{
  enable = true;
  settings = {
    git_protocol = "ssh";
    prompt = "enabled";
  };
}
