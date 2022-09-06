export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
path+="/usr/local/bin"
path+="$HOME/.local/bin"

export GOPATH=$HOME/go
path+="$GOPATH/bin"

[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env"

export EDITOR=nvim

