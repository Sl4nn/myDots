#!/bin/zsh
#source https://github.com/x70b1/polybar-scripts

if ! updates_arch=$(checkupdates 2> /dev/null | wc -l ); then
    updates_arch=0
fi

if ! updates_aur=$(yay -Qum 2> /dev/null | wc -l); then
    updates_aur=0
fi

updates=$(($updates_arch + $updates_aur))

if [ "$updates" -gt 0 ]; then
    echo $fg[red]" "
else
    echo $fg[red] ""
fi
