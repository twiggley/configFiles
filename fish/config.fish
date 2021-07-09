if status --is-login
	# start sway
	if test (tty) = '/dev/tty1'
		exec sway &> /tmp/sway_(date "+%y-%m-%dT%H%M%S")
		#exec sway &> /tmp/sway_$USER_(date "+%y-%m-%dT%H%M%S")
	end
end

starship init fish | source

