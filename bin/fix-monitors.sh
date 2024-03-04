#!/bin/sh
#
# fix startup things since not everything seems to run on i3/polybar load
#
# repurposed for general fixing shite, run at startup

# fix layout (bigboi)
#xrandr --output DP-1 --right-of DP-3

# set primary monitor for x/wayland reasons (chonkyboi)
xrandr --output DP-1 --primary
