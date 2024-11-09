{
  inputs,
  outputs,
  config,
  pkgs,
  ...
}:

let
  tomlFormat = pkgs.formats.toml { };
in
{
  imports = [
    outputs.homeManagerModules.zed
  ];

  home.username = "bokleynen";
  home.homeDirectory = "/Users/bokleynen";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11";

  nix = {
    package = pkgs.nix;
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.unstable-packages
      inputs.zig.overlays.default
    ];
    config.allowUnfree = true;
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    arcanist
    pinentry-tty
    postman
    gnupg
    grpcurl
    fzf
    ripgrep
    jless
    jq
    yq-go
    kubernetes-helm
    kubectl
    (google-cloud-sdk.withExtraComponents [ google-cloud-sdk.components.gke-gcloud-auth-plugin ])
    google-cloud-sql-proxy
    nixfmt-rfc-style
    rustup
    natscli
    nmap
    cmctl
    zed-editor

    zigpkgs.master
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".ideavimrc".source = ./.ideavimrc;
    ".p10k.zsh".source = ./.p10k.zsh;
    # nvim = {
    #   recursive = false;
    #   source = ../nvim;
    #   target = ".config/nvim";
    # };
    cargo = {
      target = ".cargo/config.toml";
      source = (
        tomlFormat.generate "config.toml" {
          net = {
            "git-fetch-with-cli" = true;
          };
          registries."crates-io" = {
            protocol = "sparse";
          };
          target = {
            "aarch64-apple-darwin" = {
              rustflags = [ "-Ctarget-cpu=native" ];
            };
          };
        }
      );
    };
  };

  home.sessionVariables = { };

  home.sessionPath = [
    "$HOME/go/bin"
    "$HOME/.local/bin"
    "/Applications/Docker.app/Contents/Resources/bin"
  ];

  editorconfig = {
    enable = true;
    settings = {
      "*" = {
        charset = "utf-8";
        insert_final_newline = true;
        trim_trailing_whitespace = true;
      };

      "*.py" = {
        indent_style = "space";
        indent_size = 4;
      };

      "*.rb" = {
        indent_style = "space";
        indent_size = 2;
      };

      "*.go" = {
        indent_style = "tab";
        indent_size = 4;
      };

      "*.hs" = {
        indent_style = "space";
        indent_size = 2;
      };

      "*.idr" = {
        indent_style = "space";
        indent_size = 2;
      };

      "*.lua" = {
        indent_style = "space";
        indent_size = 3;
      };

      "*.nix" = {
        indent_style = "space";
        indent_size = 2;
      };

      "Makefile" = {
        indent_style = "tab";
      };
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
