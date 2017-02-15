# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi

    # look for a scripts directory and source all .sh files prefixed with an underscore
    if [ -d ~/.scripts ]; then
        for sh_to_source in ~/.scripts/_*.sh; do
            . "$sh_to_source"
        done
    else
        # set prompt string to indicate scripts load failure
        PS1="[ns] $PS1"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Gradle
if [ -d "$HOME/opt/gradle" ]; then
    export GRADLE_HOME="$HOME/opt/gradle"
    PATH="$PATH:$GRADLE_HOME/bin"
fi
