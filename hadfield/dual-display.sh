#!/bin/sh

PRIMARY="$(xrandr | grep -Po "^[e].+? connected" | grep -Po "^\S+")"
OUTPUT="$(xrandr | grep -Po "^[HD].+? connected" | grep -Po "^\S+")"

#xrandr --output DP-2 --auto --output eDP-1 --auto --left-of DP-2
#xrandr --output DP-1-2 --auto --output eDP-1-1 --auto --left-of DP-1-2
xrandr --output "$OUTPUT" --mode 2560x1080_75.00_rb2 --output "$PRIMARY" --auto --left-of "$OUTPUT"