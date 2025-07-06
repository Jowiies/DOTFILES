#!/bin/bash

BACKLIGHT_DIR="/sys/class/backlight/intel_backlight"  # adjust this path if needed

max_brightness=$(cat "$BACKLIGHT_DIR/max_brightness")
current_brightness=$(cat "$BACKLIGHT_DIR/brightness")

percent=$(( 100 * current_brightness / max_brightness ))

echo "  ${percent}%"

