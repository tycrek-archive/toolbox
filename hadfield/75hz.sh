#!/bin/sh

# Modeline detection
#cvt12 2560 1080 75 -b -o

OUTPUT="$(xrandr | grep -Po "^[HD].+? connected" | grep -Po "^\S+")"
xrandr --newmode "2560x1080_75.00_rb2"  221.34  2560 2568 2600 2640  1080 1105 1113 1119 +hsync -vsync
xrandr --addmode "$OUTPUT" 2560x1080_75.00_rb2
xrandr --output "$OUTPUT" --mode 2560x1080_75.00_rb2