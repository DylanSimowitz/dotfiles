path+=$(go env GOPATH)/bin
path+=~/.local/bin
path+=~/.npm-global/bin
path+=~/dotfiles/scripts
path+=~/.cargo/bin

HISTSIZE=10000
SAVEHIST=10000
KEYTIMEOUT=1

# TRAPALRM() { neo-matrix -m "$(echo -n `fortune`)" -s -D -S 10 -d 0.5 --colormode=16 }

if [[ `uname` == "Linux" ]]; then
  source /usr/share/zsh/share/antigen.zsh
  source /usr/share/doc/pkgfile/command-not-found.zsh
elif [[ `uname` == "Darwin" ]]; then
  source /opt/homebrew/share/antigen/antigen.zsh
else
    echo 'Unknown OS!'
fi

if [[ -n "$WSLENV" ]]; then
  export BROWSER="wsl-open"
fi

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle lukechilds/zsh-nvm
antigen bundle command-not-found
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle jeffreytse/zsh-vi-mode
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

# Load the theme.
antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply

ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

eval "$(starship init zsh)"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#fff,bg=red,bold"

function merge-all() {
  gh pr list -q "map(.number)|.[]" --json number | xargs -L1 -I '#' gh pr merge '#' --merge
}

alias ibrew="arch --x86_64 /usr/local/Homebrew/bin/brew"
alias vim="nvim"
alias git="hub"
alias ls="exa --icons"
alias k="kubectl"
alias lg="lazygit"
eval $(thefuck --alias)
eval "$(direnv hook zsh)"

export SOPS_AGE_KEY_FILE=~/.config/sops/age/keys.txt
export EDITOR=nvim

NPM_PATH=$(which npm)
npm () {
  if [ -e yarn.lock ]
  then
    echo "Please use yarn with this project"
  else
    $NPM_PATH "$@"
  fi
}

# Load Angular CLI autocompletion if ng exists
if (which ng)
then
  source <(ng completion script)
fi

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

# pnpm
export PNPM_HOME="/Users/dylansimowitz/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
