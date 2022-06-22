path+="$HOME/.local/bin"

export GOPATH=$HOME/go
path+="$GOPATH/bin"

[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env"
