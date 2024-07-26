{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion = {
      enable = true;
    };
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
    '';
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];
    syntaxHighlighting = {
      enable = true;
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
    };
  };
}
