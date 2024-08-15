{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.programs.zed;
  jsonFormat = pkgs.formats.json { };
in
{
  options = {
    programs.zed = {
      enable = mkEnableOption "zed";

      settings = mkOption {
        type = jsonFormat.type;
        default = { };
      };
    };
  };

  config = mkIf cfg.enable {
    xdg.configFile."zed/settings.json" = mkIf (cfg.settings != { }) {
      source = (jsonFormat.generate "settings.json" cfg.settings).overrideAttrs (
        finalAttrs: prevAttrs: { buildCommand = lib.concatStringsSep "\n" [ prevAttrs.buildCommand ]; }
      );
    };
  };
}
