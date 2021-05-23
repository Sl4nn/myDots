#! /usr/bin/zsh

MONITOR_1=$(xrandr -q | awk '/\yconnected\y/ {print $1}' | awk -F: 'NR==1')
MONITOR_2=$(xrandr -q | awk '/\yconnected\y/ {print $1}' | awk -F: 'NR==2')

if xrandr | grep "$MONITOR_2 disconnected"; then
    xrandr --output "$MONITOR_1" --primary --mode 1920x1080
else
    xrandr --output "$MONITOR_1" --primary --mode 1920x1080 --output "$MONITOR_2" --mode 1920x1080 --right-of "$MONITOR_1"
fi
