#!/bin/bash
bval=$(cat /sys/class/backlight/intel_backlight/brightness)
bmax=$(cat /sys/class/backlight/intel_backlight/max_brightness)
presets=(2 10 40 160 540 $bmax)
if [ $# -eq 0 ]; then
    echo "Incorrect arguments."
    exit 1
elif [ $# -eq 1 ]; then
    bval=$1
elif [ $1 == "-inc" ]; then
    bval=$(expr $bval + $2)
elif [ $1 == "-dec" ]; then
    bval=$(expr $bval - $2)
elif [ $1 == "-pre" ]; then
    bval=${presets[$2]}
elif [ $1 == "--num-pre" ]; then
    echo ${#presets[@]}
fi

if [ $bval -gt $bmax ]; then bval=$bmax; fi
if [ $bval -lt 0 ]; then bval=0; fi
echo "$bval" > /sys/class/backlight/intel_backlight/brightness
