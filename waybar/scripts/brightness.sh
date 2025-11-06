#!/bin/bash
BRIGHTNESS_FILE="/sys/class/backlight/intel_backlight/brightness"
MAX_FILE="/sys/class/backlight/intel_backlight/max_brightness"

print_brightness() {
    level=$(cat "$BRIGHTNESS_FILE")
    max=$(cat "$MAX_FILE")
    percent=$((100 * level / max))

    echo " $percent%"
}

# Print once at start
print_brightness

# Watch for brightness changes and update instantly
while inotifywait -q -e modify "$BRIGHTNESS_FILE"; do
    print_brightness
done

