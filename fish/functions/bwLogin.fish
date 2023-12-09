function bwLogin -d "logs into bitwarden after checking if we're logged in"
	if not type jq -q; or not type bw -q
		echo "bw and/or jq missing"
		return 1
	end


	function __bw_check_login
		if not bw login --check &> /dev/null
			echo "bw not logged in"
			set -x BW_SESSION (bw login --raw)
			return 1
		# TODO bw cli seems to be busted and always says its locked. check env var
		# may also be better to set var Universally
		# else if not bw unlock --check &> /dev/null
		else if not set -q BW_SESSION
			echo "bw locked"
			set -x BW_SESSION (bw unlock --raw)
			return 1
		else
			return 0
		end
#		set _bw_status (bw status | jq -r '.status')
#		if test $_bw_status = "locked"
#			echo "bw locked"
#			set -x BW_SESSION (bw unlock --raw)
#			return 1
#		else if test $_bw_status = "unauthenticated"
#			echo "bw logged out"
#			set -x BW_SESSION (bw login --raw)
#			return 1
#		else if test $_bw_status = "unlocked"
#			echo "bw is unlocked"
#			return 0
#		else
#			echo "unknown response from bitwarden! $_bw_status"
#			return 1
#		end
	end

	if not __bw_check_login
		echo "wasn't logged in, will try again"
		for count in (seq 5)
			echo "retrying $count"
			if __bw_check_login
				break
			end
		end
	end
end
