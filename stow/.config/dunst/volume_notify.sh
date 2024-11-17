#!/bin/bash

# Get the current volume level
VOLUME=$(amixer get Master | grep -oP '\[\d+%\]' | head -1 | tr -d '[]%')
MUTE_STATUS=$(amixer get Master | grep -o '\[on\]') 

# If muted, set volume to 0
if [ -z "$MUTE_STATUS" ]; then
    VOLUME=0
fi

# Send the notification with a progress bar using Dunst
dunstify -r 1000 -u low -h int:value:"$VOLUME" "Volume ${VOLUME}%"
