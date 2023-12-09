if type -q git; and not type -q g:
    function g --description "rebind git cos lazy" --wraps=git
        git $argv
    end
end
