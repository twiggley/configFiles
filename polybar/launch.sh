#!/usr/bin/env bash
#
# startup script for polybar

# polybar start per monitor setup

# kill currently running instances

killall -q polybar

POLYBARBAR=twig

polybar -m >> /tmp/polybar-$USER-$POLYBARBAR.log 2>&1
# inital call to polybar -m doesn't recognise all monitors ??
sleep 1

for m in $(polybar -m | cut -d":" -f1); do
  MONITOR=$m polybar --reload $POLYBARBAR >> /tmp/polybar-$USER-$POLYBARBAR-$m.log 2>&1 &
done

# just alsamixer things
#amixer -c 0 sset Master unmute
#amixer -c 0 sset Master 100

