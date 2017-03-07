#!/bin/bash

# Script to warn user via desktop popups when the battery is below a
# certain percentage when discharging, or above a certain percentage
# when charging

battery_percent=$(acpi -b | cut -f 4 -d ' ' | sed 's/..$//')
[[ $(acpi -b | cut -f 3 -d ' ') = "Charging," ]]; is_discharging=$?
if [[ $battery_percent -lt 31 && $is_discharging = 1 ]]; then
    DISPLAY=:0.0 /usr/bin/notify-send "Battery Low: $battery_percent%"
elif [[ $battery_percent -gt 85 && $is_discharging = 0 ]]; then
    DISPLAY=:0.0 /usr/bin/notify-send "Unplug AC! $battery_percent% charged."
fi
