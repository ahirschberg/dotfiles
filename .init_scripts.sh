#!/bin/bash

# look for a scripts directory and source all .sh files prefixed with an underscore
if [ -d ~/.scripts ]; then
    for sh_to_source in ~/.scripts/_*.sh; do
        source $sh_to_source
    done
fi
