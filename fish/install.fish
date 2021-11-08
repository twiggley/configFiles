#!/usr/bin/env fish

if command -v fisher; 
    echo fisher already installed
else
    # fisher
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
end

# plugins install
fisher install PatrickF1/fzf.fish
fisher install twiggley/base16-fish
fisher install danhper/fish-ssh-agent

# ayu initialise
# set --universal ayu_variant light && ayu_load_theme

base16-darktooth

