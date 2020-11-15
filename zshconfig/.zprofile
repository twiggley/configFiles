#!/bin/zsh

figlet it begins

export TERMINAL=alacritty
export EDITOR=vim


# start x session
ssh-agent startx > ~/.startx.log 2>&1


# monitor position
#xrandr --output DP-3 --left-of DVI-D-1
xrandr --output DP-0 --left-of DVI-D-0

##########################################
# polybar on each window - moved to polybar start script
##########################################

# polybar shite
#POLYBARBAR=twig
#
#if type "xrandr"; then
#  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#    MONITOR=$m polybar --reload $POLYBARBAR &
#  done
#else
#  polybar --reload $POLYBARBAR &
#fi
#

##########################################
# just alsamixer things
##########################################

#amixer -c 0 sset Master unmute
#amixer -c 0 sset Master 100%

