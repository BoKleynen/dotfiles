export DOTFILES="$HOME/.dotfiles"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Load local configurations
if [[ -a ~/.localrc ]]
then
  source ~/.localrc
fi

plugins=(
  git
  docker
  zsh-syntax-highlighting
  asdf
)

autoload -U compinit
compinit

source $DOTFILES/zsh/p10k.zsh
source $ZSH/oh-my-zsh.sh
source $DOTFILES/zsh/aliases.zsh

eval "$(direnv hook zsh)"

complete -o nospace -C /usr/local/bin/terraform terraform
