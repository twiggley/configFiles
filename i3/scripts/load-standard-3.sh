#!/usr/bin/env bash
#
# load i3 layouts

TERMINAL=kitty

i3-msg "workspace 1; append_layout /home/twig/.config/i3/layouts/workspace-just-firefox.json"
i3-msg "workspace 3; append_layout /home/twig/.config/i3/layouts/workspace-terms-firefox-steam.json"
i3-sensible-terminal &
i3-sensible-terminal &
i3-sensible-terminal &
firefox &

