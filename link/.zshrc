export DOTFILES="$HOME/.dotfiles"

# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

if [[ -a ~/.localrc ]]
then
  source ~/.localrc
fi

# Set name of the theme to load
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  docker
  zsh-syntax-highlighting
  asdf
)

autoload -U compinit
compinit

source .p10k.zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $ZSH/oh-my-zsh.sh

export HISTORY_IGNORE="clear:bg:fg:cd:cd -:cd ..:exit:date:w:* --help:ls:l:ll:lll"

eval "$(direnv hook zsh)"

complete -o nospace -C /usr/local/bin/terraform terraform

[ -f "/home/bo/.ghcup/env" ] && source "/home/bo/.ghcup/env" # ghcup-env

alias mv='mv -i'
alias k='kubectl'
alias nv='nvim'

if [ "$(command -v exa)" ]; then
    unalias -m 'll'
    unalias -m 'l'
    unalias -m 'la'
    unalias -m 'ls'
    alias ls='exa'
    alias la='exa -la'
    alias ll='exa -l --color always --icons -a -s type'
fi

if [ "$(command -v bat)" ]; then
  unalias -m 'cat'
  alias cat='bat -pp'
fi

