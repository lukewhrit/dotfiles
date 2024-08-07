# System variables
export \
  LANG="en_US.UTF-8" \
  MONITOR="DisplayPort-2" \
  GPG_TTY="$(tty)"

# Path

PATH+=":/opt/homebrew/opt/llvm@13/bin"
PATH+=":$HOME/bin:/usr/local/bin"
PATH+=":$HOME/.cargo/bin"
PATH+=":$HOME/.deno/bin"
PATH+=":$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
PATH+=":$HOME/.local/bin"
PATH+=":$GOROOT/bin:$GOPATH/bin"
PATH+=":/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

[ -f "/Users/whrit/.ghcup/env" ] && source "/Users/whrit/.ghcup/env" # ghcup-env

# Language Setup
export N_PREFIX="$HOME/.n"
[[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin" 

export \
  GO11MODULE="on" \
  GOPATH="$HOME/Projects/go" \
  CGO_CFLAGS="-g -O2"

# Set Programs
export \
  TERM="xterm-color" \
  EDITOR="code" \
  PAGER="less" \
  BROWSER="firefox"

# Program Configuation
export \
  PF_INFO="ascii title os host kernel uptime wm pkgs memory" 
. "$HOME/.cargo/env"

# LLVM
export LDFLAGS="-L/opt/homebrew/opt/llvm@13/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm@13/include"
