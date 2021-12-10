#!/usr/bin/env bash
#
# load i3 layouts

TERMINAL=alacritty

i3-msg "workspace 1; append_layout ~/.config/i3/layouts/workspace-just-firefox.json"
i3-msg "workspace 2; append_layout ~/.config/i3/layouts/workspace-terms-firefox-steam.json"
i3-sensible-terminal &
i3-sensible-terminal &
i3-sensible-terminal &
firefox &

