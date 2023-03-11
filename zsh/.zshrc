export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
path+="/usr/local/bin"
path+="$HOME/.local/bin"
path+="/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin"
path+="$GOPATH/bin"

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env"

# Load local configurations
if [[ -a ~/.localrc ]]
then
  source ~/.localrc
fi

plugins=(
  git
  docker
  asdf
  zsh-syntax-highlighting
)

autoload -U compinit
compinit

source $DOTFILES/zsh/p10k.zsh
source $ZSH/oh-my-zsh.sh
source $DOTFILES/zsh/aliases.zsh

eval "$(direnv hook zsh)"

complete -o nospace -C /usr/local/bin/terraform terraform
