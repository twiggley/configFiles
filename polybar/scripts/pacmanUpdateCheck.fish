#!/usr/bin/env fish

set runningfile "/tmp/pacmanUpdateCheck-$USER"

if test -f $runningfile
    # process started by some other bar
    exit
else
    touch $runningfile
end


set soutput

if ! command -v checkupdates >/dev/null 2>&1
    set -a soutput "pacman not found"
else
    set pacoutput (checkupdates | wc -l)
    if test $pacoutput -gt 0
        set -a soutput "$pacoutput arch updates"
    end
end

if ! command -v aur >/dev/null 2>&1
    set -a soutput "aur not found"
else
    set auroutput (aur repo -u | wc -l)
    if test $auroutput -gt 0
        set -a soutput "$auroutput aur updates"
    end
end

if test -n "$soutput"
    set finaloutput (string join ", " $soutput)
else
    set finaloutput "all updated ya good bean"
end

rm -f $runningfile

echo $finaloutput
