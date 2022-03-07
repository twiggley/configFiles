#!/usr/bin/env fish

set host_profile $argv[1]

echo "making adjustments for host $host_profile"

# clean/create directory for this config
set generated_dir "hosts/generated/$host_profile"

#echo (pwd)
#echo "clearing dir: $generated_dir"
rm -rf "$generated_dir/*"
mkdir -p $generated_dir

if test $host_profile = "roughboi"
    # create files that we'll link in dotbot
    cp -r waybar "$generated_dir"
    sed -E "s/(\@import \"colors\/)([^ \"]+)(\"\;)/\1base16-monokai.css\3/g" waybar/style.css > "$generated_dir/waybar/style.css"

    mkdir -p "$generated_dir/fish"
	sed -E "/if command \-v starship/,+3d" fish/config.fish > "$generated_dir/fish/config.fish"

else if test $host_profile = "shinyboi"
    cp -r sway "$generated_dir"
    sed -E "s/(output \* bg )([^ ]+)( fill)/\1\~\/Downloads\/5053_astro.png\3/g" sway/config > "$generated_dir/sway/config"

    cp -r waybar "$generated_dir"
    sed -E "s/(\@import \"colors\/)([^ \"]+)(\"\;)/\1base16-monokai.css\3/g" waybar/style.css > "$generated_dir/waybar/style.css"

    mkdir -p "$generated_dir/fish"
	sed -E "/if command \-v starship/,+3d" fish/config.fish > "$generated_dir/fish/config.fish"
	sed -E "s/(set mybase16 ).*/\1gruvbox-dark-soft/g" fish/install.fish > "$generated_dir/fish/install.fish"

	chmod +x "$generated_dir/fish/install.fish"
end

