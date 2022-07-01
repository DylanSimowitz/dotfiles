path+=$(go env GOPATH)/bin
path+=~/.local/bin
path+=~/.npm-global/bin
path+=~/dotfiles/scripts
path+=~/.cargo/bin

HISTSIZE=10000
SAVEHIST=10000
KEYTIMEOUT=1
TMOUT=600

TRAPALRM() { neo-matrix -m "$(echo -n `fortune`)" -s -D -S 10 -d 0.5 --colormode=16 }

if [[ `uname` == "Linux" ]]; then
  source /usr/share/zsh/share/antigen.zsh
  source /usr/share/doc/pkgfile/command-not-found.zsh
elif [[ `uname` == "Darwin" ]]; then
  source /opt/homebrew/share/antigen/antigen.zsh
else
    echo 'Unknown OS!'
fi
source ~/secrets.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
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

alias ibrew="arch --x86_64 /usr/local/Homebrew/bin/brew"
alias vim="nvim"
alias git="hub"
alias ls="exa --icons"
alias k="kubectl"
eval $(thefuck --alias)
eval "$(direnv hook zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
