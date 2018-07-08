#!/bin/sh

# Aliases for bash
# Copyright © 2017 Alex Hirschberg

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.


if [[ ! -z $(which nvim) ]]; then
    alias vi="nvim $@" # rebind vi to use neovim

fi

# Git aliases
alias g="git status $@"

# dotfiles git
alias gdf='/usr/bin/git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME'

GATECH_CS="$HOME/projects/gatech-cs"
function brandonsim() {
    nohup java -jar $GATECH_CS/resource/Brandonsim-2.7.4.jar $1 > /dev/null &
}

alias cks="java -jar $GATECH_CS/ta_1331/resource/checkstyle-6.2.2.jar $@"

alias cdd="cd ../.."

# add autojump commands
if [ "$(shell_type)" = "zsh" ]; then
    : # do nothing, zsh handles autojump
elif [ -f /usr/share/autojump/autojump.sh ]; then
    source /usr/share/autojump/autojump.sh
elif [ -f /usr/share/autojump/autojump.bash ]; then
    source /usr/share/autojump/autojump.bash
fi

function pkg-f() {
    sudo apt update

    # if i3blocks is running, update the pkg notification
    pgrep -x "i3blocks" > /dev/null && sudo pkill i3blocks -RTMIN+12
}
function pkg-u() {
    sudo apt update; sudo apt upgrade -y

    # if i3blocks is running, update the pkg notification
    pgrep -x "i3blocks" > /dev/null && sudo pkill i3blocks -RTMIN+12
}
alias pkg-l="apt list --upgradable"
function o() {
    xdg-open "$@" >/dev/null &
}

#alias ipython2="python `which ipython`"

alias mybinds="bind -p | less"
alias keybindings="~/.scripts/keybindings"
alias l="ls"
alias la="ls -a"
alias ll="ls -lh"
alias lla="ls -lha"

function catall() {
    tail -vn +1 $@ | less
}

function hgrep() {
    history | grep $@ | less
}

alias whomst="who | sed -E 's/a|b|g|m|p/[b]/g'"

alias odh="od -A x -t x1z -v"
