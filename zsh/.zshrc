export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
path+="$HOME/.local/bin"
path+="/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin"
path+="$GOPATH/bin"
export PATH="$HOME/.local/zig:$PATH"

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
  asdf
  zsh-syntax-highlighting
)

autoload -Uz compinit; compinit

source $DOTFILES/zsh/p10k.zsh
source $ZSH/oh-my-zsh.sh
source $DOTFILES/zsh/aliases.zsh

eval "$(direnv hook zsh)"

