{ config, pkgs, ... }:

{
  enable = true;
  silent = false;
  enableZshIntegration = true;
  nix-direnv.enable = true;
  config = {
    load_dotenv = false;
    strict_env = true;
  };
}
