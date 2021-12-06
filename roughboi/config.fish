if status --is-login
    # audio logic for desktop
    #set -ul headset_name (pactl list sinks short | grep G432 | cut -f 2)
    #if test (count $headset_name) -eq 1
    #    pactl set-default-sink $headset_name
    #end

	if test (tty) = '/dev/tty1'
        # sway
        if command -v sway > /dev/null 2>&1
            exec sway > /tmp/sway-$USER-(date "+%y-%m-%dT%H%M%S").log 2>&1
        # x
        else if command -v startx > /dev/null 2>&1
            exec startx > /tmp/startx-$USER-(date "+%y-%m-%dT%H%M%S").log 2>&1
        # oh shit
        else
            echo no display manager 
        end
	end
end

#if command -v starship > /dev/null 2>&1
#    starship init fish | source
#end

