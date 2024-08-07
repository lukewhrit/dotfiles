## =============================
##          Shell Setup         
## =============================

eval "$(/opt/homebrew/bin/brew shellenv)"

eval "$(starship init zsh)"

autoload -Uz url-quote-magic
autoload -Uz bracketed-paste-magic
autoload -Uz compinit
autoload -Uz add-zsh-hook

## =============================
##       Setup completions      
## =============================

fpath=(~/.comp $fpath)
zmodload zsh/complist

if [[ -n ${ZDOTDIR}/.zcompdump(\#qN.mh+24) ]]; then
  compinit;
else
  compinit -C;
fi;

## =============================
##  Load plugins  
## =============================

if [[ ! -f ~/.zpm/zpm.zsh ]]; then
  git clone --recursive https://github.com/zpm-zsh/zpm ~/.zpm
fi

source ~/.zpm/zpm.zsh

zpm load \
  zpm-zsh/clipboard                                \
  zpm-zsh/zsh-better-npm-completion,async          \
  zpm-zsh/zsh-completions                          \
  zpm-zsh/zsh-history-substring-search,async       \
  zsh-users/zsh-autosuggestions,async              \
  zpm-zsh/fast-syntax-highlighting,async

# Load fzf
source <(fzf --zsh)

# Load zsh completions
fpath=(${ZDOTDIR:-$HOME/.config/zsh}/plugins/zsh-completions/src $fpath)

## =============================
##          Keybindings         
## =============================

bindkey -e
bindkey '^[[7~' beginning-of-line # Home key
bindkey '^[[H' beginning-of-line  # Home key

if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line # [Home] - Go to beginning of line
fi

bindkey '^[[8~' end-of-line # End key
bindkey '^[[F' end-of-line  # End key

if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}" end-of-line # [End] - Go to end of line
fi

bindkey '^[[2~' overwrite-mode                    # Insert key
bindkey '^[[3~' delete-char                       # Delete key
bindkey '^[[C'  forward-char                      # Right key
bindkey '^[[D'  backward-char                     # Left key
bindkey '^[[5~' history-beginning-search-backward # Page up key
bindkey '^[[6~' history-beginning-search-forward  # Page down key

# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word
bindkey '^[Od' backward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# delete previous word with ctrl+backspace
bindkey '^H' backward-kill-word

# Shift+tab undo last action
bindkey '^[[Z' undo

# Aliases
source .config/aliasrc

## =============================
##  Misc. Settings 
## =============================

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true # automatically find new executables in path

# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zsh

HISTFILE=~/.cache/zsh/zhistory
HISTSIZE=1000
SAVEHIST=500

WORDCHARS=${WORDCHARS//\/[&.;]} # Don't consider certain characters part of the word

## =============================
##  Environment Variables 
## =============================

source "${HOME}/.zshenv"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# pnpm
export PNPM_HOME="/Users/whrit/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
