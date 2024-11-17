#!/bin/bash

# Get the current brightness percentage
BRIGHTNESS=$(brightnessctl g)      # Gets the current brightness level
MAX_BRIGHTNESS=$(brightnessctl m)  # Gets the maximum brightness level
BRIGHTNESS_PERCENT=$(( BRIGHTNESS * 100 / MAX_BRIGHTNESS ))

# Send the notification with a progress bar using Dunst
dunstify -r 1000 -u low -h int:value:"$BRIGHTNESS_PERCENT" "Brightness ${BRIGHTNESS_PERCENT}%"

