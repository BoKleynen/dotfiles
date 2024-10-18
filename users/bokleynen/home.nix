{
  config,
  pkgs,
  ...
}:

let
  tomlFormat = pkgs.formats.toml { };
in
{
  imports = [
    programs/alacritty.nix
    programs/atuin.nix
    programs/bat.nix
    programs/direnv.nix
    programs/eza.nix
    programs/fd.nix
    programs/gh.nix
    programs/git.nix
    programs/go.nix
    programs/k9s.nix
    programs/lazygit.nix
    programs/neovim.nix
    programs/vscode.nix
    programs/zellij.nix
    programs/zsh.nix
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

  nixpkgs = {
    config.allowUnfree = true;
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # arcanist
    pinentry-tty
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
    cmctl

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

  home.sessionVariables = {
    LANG = "en_US.UTF-8";
    LC_CTYPE = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
  };

  home.sessionPath = [
    "$HOME/go/bin"
    "$HOME/.local/bin"
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
