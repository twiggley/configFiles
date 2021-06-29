#!/usr/bin/env fish

# fisher
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

# plugins install
fisher install jethrokuan/fzf
fisher install edouard-lopez/ayu-theme.fish
fisher install danhper/fish-ssh-agent

# ayu initialise
set --universal ayu_variant light && ayu_load_theme

