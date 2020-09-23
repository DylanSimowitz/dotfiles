# Startup
autoload -Uz zmv

# Environment Variables
export LIGHTHOUSE_CHROMIUM_PATH=/usr/bin/chromium
export LIBVIRT_DEFAULT_URI='qemu:///system'
export EDITOR=nvim
export SUDO_EDITOR=nvim
export VISUAL=code
export KEYTIMEOUT=1
export DOTBARE_DIR="$HOME/.cfg"
export DOTBARE_TREE="$HOME"

# Prerequisites
source /usr/share/zsh/share/antigen.zsh

# Settings
zstyle ':completion:*' rehash true
setopt INC_APPEND_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
KEYTIMEOUT=1
SAVEHIST=10000
HISTSIZE=10000
HISTFILE=~/.zsh_history

# Antigen
antigen use oh-my-zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle thefuck
antigen bundle adb
antigen bundle command-not-found
antigen theme bira
antigen bundle kazhala/dotbare
antigen apply

# Keybinds
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -v

# Aliases
alias vim='nvim'
alias zshrc='vim ~/.config/zsh/.zshrc'
alias vimrc='vim ~/.vimrc'
alias git=hub
alias clip-ssh='xclip ~/.ssh/id_rsa.pub -selection clipboard'
alias vpn='nmcli con up id '
alias docker-ip="docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'"
alias tmuxr="systemctl --user restart tmux"
alias matrix="unimatrix -n -s 96 -a"
eval "$(thefuck --alias)"

# Initialization
source /usr/share/nvm/init-nvm.sh
clear; gfetch
