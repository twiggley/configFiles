if type -q fdfind; and not type -q fd:
    function fd --description "rename fdfind to what it wants to be" --wraps=fdfind
        fdfind $argv
    end
end
