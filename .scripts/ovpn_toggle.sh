#!/bin/bash
service openvpn status | grep "inactive"
inactive=$?
cmd="start"
echo $inactive
if [[ $inactive != 0 ]]; then
    cmd="stop"
fi

service openvpn $cmd
echo $cmd $?
DISPLAY=:0.0 /usr/bin/notify-send "$? $cmd"
exit $?
