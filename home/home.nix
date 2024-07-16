{
  outputs,
  config,
  pkgs,
  ...
}:

{
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
    ];
    config.allowUnfree = true;
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    pinentry-tty
    delta
    gh
    arcanist

    gnupg

    neovim
    fzf
    direnv

    ripgrep
    fd
    bat
    eza
    jless

    kubernetes-helm
    kubectl

    (google-cloud-sdk.withExtraComponents [ google-cloud-sdk.components.gke-gcloud-auth-plugin ])
    google-cloud-sql-proxy

    nixfmt-rfc-style

    discord
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".ideavimrc".source = ./.ideavimrc;
    ".p10k.zsh".source = ./.p10k.zsh;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    PNPM_HOME = "/Users/bokleynen/Library/pnpm";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      mv = "mv -i";
      k = "kubectl";
      nv = "nvim";
      ls = "eza";
      la = "eza -la";
      ll = "eza -l --color always --icons -a -s type";
      cat = "bat -pp";
    };
    initExtraFirst = ''
      if [[ -r "$${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-$${(%):-%n}.zsh" ]]; then
        source "$${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-$${(%):-%n}.zsh"
      fi
    '';
    initExtra = ''
      source $HOME/.p10k.zsh

      path+="$HOME/.local/bin"
      path+="$GOPATH/bin"
    '';
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.zsh-syntax-highlighting;
        file = "share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh";
      }
    ];
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
    };
  };
}
