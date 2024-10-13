{ inputs, pkgs, ... }:
{
  users.users.bokleynen = {
    home = "/Users/bokleynen";
    shell = pkgs.zsh;
  };

  homebrew = {
    enable = true;
    casks = [
      "arc"
      "discord"
      "raycast"
      "signal"
      "slack"
      "spotify"
      "warp"
    ];
  };
}
