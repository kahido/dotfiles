# Kahido's config for the Z-Shell

# Autoload modules
autoload -U compinit colors
colors

# Report command runnin time if it is more than 3 seconds
REPORTTIME=3

# Keep a lot of history
HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000

# Add commands to history as they are entered, don't wait for shell to exit
setopt INC_APPEND_HISTORY
# Also remember command start time and duration
setopt EXTENDED_HISTORY
# Do not keep duplicate commands in history
setopt HIST_IGNORE_ALL_DUPS
# Do not remember commands that start with a whitespace
setopt HIST_IGNORE_SPACE
# Correct spelling of all arguments in the command line
setopt CORRECT_ALL

# vi mode
#bindkey -v
#export KEYTIMEOUT=1

# Enable autocompletion
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
#_comp_options+=(globdots)		# Include hidden files.

# Disable auto correct
unsetopt correct_all

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
#bindkey -v '^?' backward-delete-char

# Configure prompt with Git support
autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' formats ' %F{red}(%b%f%F{white}%m%u%c%f%F{red})%f'
zstyle ':vcs_info:git:*' actionformats ' %F{red}(%b%f%F{white}%u%c%f %F{magenta}[%a]%f%F{red})%f'
#zstyle ':vcs_info:git:*' actionformats ' %F{red}(%b%f%F{white}%m%u%c%f %F{magenta}[%a]%f%F{red})%f'

setopt PROMPT_SUBST
PROMPT='%F{green}%n@%M%f %F{blue}%(5~|%-1~/.../%3~|%4~)%f${vcs_info_msg_0_} $ '
RPROMPT='$(date +"%H:%M")'

# user-friendly command output
export CLICOLOR=1
ls --color=auto &> /dev/null && alias ls='ls --color=auto'

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

if [[ ! "$PATH" == *${HOME}/.local/bin* ]]; then
    export PATH="${PATH:+${PATH}:}${HOME}/.local/bin"
fi

alias config='/usr/bin/git --git-dir=${HOME}/.dotfiles/ --work-tree=${HOME}'
