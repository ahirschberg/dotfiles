#!/bin/bash

# enable bash ** support and ! history verification
shopt -s globstar
shopt -s histverify

export HISTFILESIZE=
export HISTSIZE=10000
# fix other programs truncating the .bash_history file
# via http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.my_bash_history

export EDITOR=`which nvim`

function set_pcolor() {
    if [ $? == 0 ]; then
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
    CF1="$RESET\[$(tput setaf 238)$(tput setab 237)\]"
    CF2="$RESET\[$(tput setaf 236)$(tput setab 235)\]"
    export PS1="$PBACK\[\$(set_pcolor)\]•$PBACK \w $DIM\u$(host_maybe)$CF1▌$CF2▌$RESET "
fi

PROMPT_DIRTRIM=2
