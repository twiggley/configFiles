function vif --description "searches for files and opens results with vim"
	fd -H -tf $argv -X vim
end
