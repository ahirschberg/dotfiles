#!/bin/bash

# enable bash ** support and ! history verification
shopt -s globstar
shopt -s histverify

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

BOLD="\[$(tput bold)\]"
DIM="\[$(tput dim)\]"
RESET="\[$(tput sgr0)\]"
PGOOD="$(tput setaf 119)"
PBAD="$(tput setaf 167)"
PBACK="$RESET\[$(tput setab 238)\]"
FAKEBG="$RESET\[$(tput setaf 238)\]"
export PS1="$PBACK\[\$(set_pcolor)\]\$$PBACK \w $DIM\u$(host_maybe) $FAKEBG▓░$RESET"
PROMPT_DIRTRIM=2
