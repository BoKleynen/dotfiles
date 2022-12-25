export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
path+="/usr/local/bin"
path+="$HOME/.local/bin"
path+="/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin"

export GOPATH=$HOME/go
path+="$GOPATH/bin"

[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env"

export EDITOR=nvim
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
export GPG_TTY=$(tty)
export HOMEBREW_NO_AUTO_UPDATE=1
