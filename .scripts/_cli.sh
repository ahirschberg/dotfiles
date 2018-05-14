#!/bin/sh

# Bash command line setup
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



# enable bash ** support and ! history verification
if [ "$(shell_type)" = "bash" ]; then
    shopt -s globstar
    shopt -s histverify
    shopt -s dotglob
    export HISTFILESIZE=
    export HISTSIZE=10000
    export HISTTIMEFORMAT="%a %D %H:%m "
    # fix other programs truncating the .bash_history file
    # via http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
    export HISTFILE=~/.my_bash_history
fi

if [ "$(shell_type)" = "zsh" ]; then
    setopt dotglob
fi

if [ ! -z "$(which nvim)" ]; then
    export EDITOR=`which nvim`
else
    export EDITOR=`which vim`
fi

# setup vim gruvbox theme custom colors
# note that all vim configuration is stored in the nvim directory since they
# are cross-compatible
gruvbox_colors="$HOME/.config/nvim/bundle/gruvbox/gruvbox_256palette.sh"
if [ -f "$gruvbox_colors" ]; then
    source $gruvbox_colors
fi

function set_pcolor() {
    cached=$?
    if [ $cached == 0 ]; then
        echo $PGOOD
    else
        echo $PBAD
    fi
}

function host_maybe() {
    hostn=$(hostname)
    if [[ "$hostn" != "ubuntu" ]]; then
        echo "@$hostn"
    fi
}

function show_termcolors() {
    for C in {0..255}; do
        tput setab $C
        echo -n "$C "
    done
    tput sgr0
    echo
}

if [[ $(tput colors) -gt 8 ]]; then

    BOLD="\[$(tput bold)\]"
    DIM="\[$(tput dim)\]"
    RESET="\[$(tput sgr0)\]"
    PGOOD="$(tput setaf 119)"
    PBAD="$(tput setaf 167)"
    PBACK="$RESET\[$(tput setab 238)\]"

    # NOTE: $HAS_POWERLINE_GLYPHS should be set in a file sourced BEFORE this one.
    # _.sh files in the .scripts folder are sourced in alphabetical (BASH default)
    # order in your ~/.init_scripts.sh
    if [[ ! -v HAS_POWERLINE_GLYPHS ]]; then
        CF1="$RESET\[$(tput setaf 238)$(tput setab 237)\]"
        CF2="$RESET\[$(tput setaf 236)$(tput setab 235)\]"
        export PS1="$PBACK\[\$(set_pcolor)\]•$PBACK \w $DIM\u$(host_maybe)$CF1▌$CF2▌$RESET "
    else
        CF1="$RESET\[$(tput setaf 238)\]"
        export PS1="$PBACK\[\$(set_pcolor)\]•$PBACK \w $DIM\u$(host_maybe) ${CF1}$RESET "
    fi
fi

PROMPT_DIRTRIM=2
# add admin binaries, even if we can't run them
export PATH="$PATH:/sbin/:/usr/sbin/:/usr/local/sbin/"
