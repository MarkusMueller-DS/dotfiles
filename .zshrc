# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/markusmuller/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/markusmuller/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/markusmuller/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/markusmuller/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="/opt/homebrew/lib/ruby/gems/3.0.0/gems/twurl-0.9.6/bin:$PATH"
export PATH="/opt/homebrew/lib/ruby/gems/3.0.0/gems/colorls-1.4.4/exe:$PATH"
export PATH="/usr/local/texlive/2021/bin/universal_darwin:${PATH}"
export PATH="/opt/homebrew/Cellar/shpotify/2.1/bin:$PATH"
export PATH="/Users/markusmuller/scripts:$PATH"
export JAVA_HOME="/Applications/Android Studio.app/Contents/jre/Contents/Home/"
export TERM=xterm-256color


zstyle ':completion:*' menu select

setopt nobeep autocd

export ZPLUG_HOME=$(brew --prefix)/opt/zplug
source $ZPLUG_HOME/init.zsh


bindkey -v 
export KEYTIMEOUT=1

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# use vim keys in tab complete mode
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

alias cona='conda activate' 
alias cond='conda deactivate'
alias h='cd ~' # go to home from anywhere
alias day='/Users/markusmuller/scripts/day.sh'
alias dayc='/Users/markusmuller/scripts/dayclose.sh'
alias dev-tmux='/Users/markusmuller/scripts/dev-tmux.sh'
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias v='vim'
alias nv='nvim'
alias e='exit'
alias cat='bat'
alias c='clear'
alias t='tmux'      # create a new session t session_name
alias ta='t a -t'   # attach to an existing session   
alias tls='t ls'    # list all sessions
alias tn='t new -t'
alias space="ncdu"

eval "$(starship init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAUL_OPS="--extended"

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-z/zsh-z.plugin.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
