#!/usr/bin/env bash

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

# is there no better way?
GATECH_CS="$HOME/projects/gatech-cs"

alias cdd="cd ../.."

# add autojump commands
if [ -f /usr/share/autojump/autojump.sh ]; then
    source /usr/share/autojump/autojump.sh
fi

alias uapt="sudo apt update && sudo apt upgrade -y"
alias lapt="apt list --upgradable"
alias o="gnome-open $@"

function zup() {
    echo "this doesnt work yet..."
    folder=$1
    path_up=$PWD
    if [ -d "$folder/../__MACOSX" ]; then
        echo "Removing __MACOSX folder from $folder/.."
        rm -r "$folder/../__MACOSX"
    fi
    rm "$folder/.DS_Store"
    mv $folder/* $path_up
    rm -d $folder/
}

alias ipython2="python `which ipython`"
