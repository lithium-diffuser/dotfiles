# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_CUSTOM=$HOME/.dotfiles/.oh-my-zsh/custom

# Set oh-my-zsh to auto update
# DISABLE_UPDATE_PROMPT=true
# Uncomment to disable automatic upgrades
# DISABLE_AUTO_UPDATE=true
zstyle ':omz:update' mode auto

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="frosty"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	brew
	# common-aliases
	git
	macos
	# rsync
	sudo
	zsh-syntax-highlighting
	tmux
)

eval $(thefuck --alias)

# User configuration
export DEFAULT_USER="daniellemaier"
export LANG="en_US.UTF-8"
export EDITOR=/usr/local/bin/rnano
export VISUAL="$EDITOR"
export TERMINFO_DIRS=$TERMINFO_DIRS:$HOME/.local/share/terminfo
export HISTCONTROL=ignoreboth
export TERM=xterm-256color	

# PATH
export PATH=$HOME/bin:/usr/local/bin:/opt/homebrew/bin:$PATH
export PATH="/usr/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/java/jdk1.8.0_74/bin:$PATH"
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/opt/local/bin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/usr/local/opt/sqlite/bin:$PATH"
export PATH=/users/daniellemaier/.local/bin:$PATH
export SSH_KEY_PATH="~/.ssh/rsa_id"
export GEM_HOME="$HOME/.gems"
export GOPATH="$HOME/workspace/go"
export GOROOT="/usr/local/opt/go/libexec"
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# Run tmux on startup
# ZSH_TMUX_AUTOSTART=true
#if [ "$TMUX" = "" ]; then exec tmux; fi
#if [[ ! $(tmux list-sessions) ]]; then 
#  tmux
#fi
if [ -z "$TMUX" ]; then
    attach_session=$(tmux 2> /dev/null ls -F \
        '#{session_attached} #{?#{==:#{session_last_attached},},1,#{session_last_attached}} #{session_id}' |
        awk '/^0/ { if ($2 > t) { t = $2; s = $3 } }; END { if (s) printf "%s", s }')

    if [ -n "$attach_session" ]; then
        tmux attach -t "$attach_session"
    else
        tmux
    fi
fi


# Oh-My-ZSH
source $ZSH/oh-my-zsh.sh

# shell
bindkey -v
bindkey -M viins 'jj' vi-cmd-mode
bindkey '^R' history-incremental-search-backward
setopt extendedglob nocaseglob globdots

# nnn config
BLK="0B"
CHR="0B"
DIR="04"
EXE="06"
REG="00"
HARDLINK="06"
SYMLINK="06"
MISSING="00"
ORPHAN="09"
FIFO="06"
SOCK="0B"
OTHER="06"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"

# Aliases
source ~/.dotfiles/.aliases.zsh