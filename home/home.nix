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
    gh
    arcanist
    gnupg

    neovim
    fzf
    ripgrep
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
    XDG_CONFIG = "$HOME/.config";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
