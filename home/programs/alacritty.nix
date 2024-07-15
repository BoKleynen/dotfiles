{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      import = [
        "./base16_default_dark.toml"
      ];
      working_directory = "None";

      font = {
        size = 12.0;
        normal = {
          family = "MonoLisa Nerd Font";
          style = "Regular";
        };
        bold = {
          style = "Bold";
        };
        bold_italic = {
          style = "Bold Italic";
        };
        italic = {
          style = "Italic";
        };
      };

      mouse = {
        hide_when_typing = true;
      };

      scrolling = {
        history = 10000;
      };

      shell = {
        program = "/bin/zsh";
        args = ["-l"];
      };

      window = {
        decorations = "full";
        dynamic_title = true;
        opacity = 1.0;
        startup_mode = "Windowed";
        title = "Alacritty";
      };

      keyboard.bindings = [
        { chars = "\\u001Bc"; key = "C"; mods = "Command"; }
        { chars = "\\u001Bq"; key = "Q"; mods = "Command"; }
        { chars = "\\u001Bx"; key = "X"; mods = "Command"; }
        { chars = "\\u001Bz"; key = "Z"; mods = "Command"; }
      ];
    };
  };
}
