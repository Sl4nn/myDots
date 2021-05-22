#! /usr/bin/zsh

MONITOR_1=$(xrandr -q | awk '/\yconnected\y/ {print $1}' | awk -F: 'NR==1')
MONITOR_2=$(xrandr -q | awk '/\yconnected\y/ {print $1}' | awk -F: 'NR==2')

if xrandr | grep "$MONITOR_2 disconnected"; then
    xrandr --output "$MONITOR_1" --primary --mode 1920x1080
    bspc monitor "$MONITOR_1" -d 1 2 3 4 5
else
    xrandr --output "$MONITOR_1" --primary --mode 1920x1080 --output "$MONITOR_2" --mode 1920x1080 --right-of "$MONITOR_1"
    bspc monitor "$MONITOR_1" -d 1 2 3 4 5
    bspc monitor "$MONITOR_2" -d 6 7 8 9 0
fi
