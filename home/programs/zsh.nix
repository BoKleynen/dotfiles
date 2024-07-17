{ config, pkgs, ... }:

{
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
}
