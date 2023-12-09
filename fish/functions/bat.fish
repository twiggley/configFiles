if type -q batcat; and not type -q bat:
    function bat --description "rename batcat to what it really should be" --wraps=batcat
        batcat $argv
    end
end

