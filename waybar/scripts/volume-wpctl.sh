#!/bin/bash

# Get volume and mute status from PipeWire
read -r volume muted <<< $(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2, $3}')

# Convert volume (0.0–1.5) to percent
vol_percent=$(awk -v vol="$volume" 'BEGIN { printf "%d", (vol > 1 ? 100 : vol * 100) }')

# Set icon
if [ "$muted" = "[MUTED]" ]; then
    icon=""
elif (( vol_percent <= 30 )); then
    icon=""
else
    icon=""
fi

echo "$icon $vol_percent%"

