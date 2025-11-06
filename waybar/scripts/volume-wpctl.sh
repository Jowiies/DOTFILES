#!/bin/bash
print_volume() {
    read -r volume muted <<< $(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2, $3}')
    vol_percent=$(awk -v vol="$volume" 'BEGIN { printf "%d", (vol > 1 ? 100 : vol * 100) }')

    if [ "$muted" = "[MUTED]" ]; then
        icon=""
    elif (( vol_percent <= 30 )); then
        icon=""
    else
        icon=""
    fi

    echo "$icon $vol_percent%"
}

# Print once at startup
print_volume

# Then update whenever PipeWire emits an event
wpctl subscribe | grep --line-buffered "change" | while read -r _; do
    print_volume
done

