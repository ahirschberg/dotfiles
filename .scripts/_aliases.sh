#!/bin/bash

if command -v nvim >/dev/null 2>&1; then
    alias vi="nvim $@" # rebind vi to use neovim

    # setup vim gruvbox theme custom colors
    source ~/.config/nvim/bundle/gruvbox/gruvbox_256palette.sh
fi

# Git aliases
alias g="git status"

# dotfiles git
alias gdf='/usr/bin/git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME'

# is there no better way?
GATECH_CS="$HOME/projects/gatech-cs"

alias cdd="cd ../.."

# add autojump commands
if [ -f /usr/share/autojump/autojump.sh ]; then
    source /usr/share/autojump/autojump.sh
fi

alias uapt="sudo apt update && sudo apt upgrade"
alias lapt="apt list --upgradable"

ext() {
    $@ 2> /dev/null &
}
