#!/bin/bash

shell_type() {
    if [ ! -z "$BASH" ]; then echo "bash"
    elif [ ! -z "$ZSH_VERSION" ]; then echo "zsh"
    else echo "sh"
    fi
}

# look for a scripts directory and source all .sh files prefixed with an underscore
if [ -d ~/.scripts ]; then
    for sh_to_source in ~/.scripts/_*.sh; do
        source $sh_to_source
    done
fi
