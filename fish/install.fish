#!/usr/bin/env fish

if functions -q fisher; 
    echo fisher already installed
else
    # fisher
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
end

# add new plugins to this list for them to be installed
set -a desired_fisher_plugins \
jorgebucaran/fisher \
PatrickF1/fzf.fish \
twiggley/base16-fish \
danhper/fish-ssh-agent \

set -a existing_fisher_plugins (fisher list)
set -a extra_plugins $existing_fisher_plugins

for desired in $desired_fisher_plugins
    if not contains $desired $existing_fisher_plugins
        echo "missing a plugin, installing"
        fisher install $desired
    else
        echo "locally installed plugin found: $desired"
		# remove the desired plugin, to create list of extra locally installed plugins
        set -e extra_plugins[(contains -i $desired $extra_plugins)]
    end
end

echo "these are installed locally but not in desired list, maybe add to the main repo?
$extra_plugins"

# ayu initialise
# set --universal ayu_variant light && ayu_load_theme

# base16-darktooth
# base16-qualia
base16-gruvbox-dark-soft


