if status --is-login
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

if command -v starship > /dev/null 2>&1
    starship init fish | source
end

