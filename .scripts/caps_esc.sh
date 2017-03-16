#!/bin/sh

# Apply a mapping from caps lock to escape via xkbmap and xmodmap
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

map_file="$HOME/.scripts/xkbmap"

if [ ! -f "$map_file" ]; then
    echo "no xkbmap file, attempting to create one by compiling from xmodmap"
    echo "If the caps mapping is already active, this will actually undo it permanently and you will need to delete $map_file and run this script again."
    xmodmap "$HOME/.scripts/caps_esc.xmodmap"
    xkbcomp $DISPLAY $map_file
fi

xkbcomp "$map_file" $DISPLAY
