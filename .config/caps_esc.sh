#!/bin/sh
# Set caps lock to function as escape/control

setxkbmap -option 'caps:ctrl_modifier'
xcape -e 'Caps_Lock=Escape'
