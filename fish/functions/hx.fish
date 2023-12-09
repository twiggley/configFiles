if type -q helix; and not type -q hx:
    function hx --description "rename helix to what it should? be" --wraps=helix
        helix $argv
    end
end
