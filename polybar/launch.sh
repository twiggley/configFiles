#!/usr/bin/env bash
#
# startup script for polybar

# polybar start per monitor setup

# kill currently running instances

start_polybar_with_log()
{
  echo "---" | tee -a /tmp/polybar$POLYBARBAR.log
  polybar --reload $POLYBARBAR  >> /tmp/polybar$POLYBARBAR.log 2>&1 &
}

killall -q polybar

POLYBARBAR=twig

#if command -v "xrandr" 2>&1 > /dev/null; then
  for m in $(polybar -m | cut -d":" -f1); do
    MONITOR=$m polybar --reload $POLYBARBAR >> /tmp/polybar-$USER-$POLYBARBAR-$m.log 2>&1 &
  done
  # monitor position rearranging
  #xrandr --output DP-3 --left-of DVI-D-1
  #start_polybar_with_log
#else
#  polybar --reload $POLYBARBAR  >> /tmp/polybar-$USER-$POLYBARBAR.log 2>&1 &
#fi


# just alsamixer things
#amixer -c 0 sset Master unmute
#amixer -c 0 sset Master 100

