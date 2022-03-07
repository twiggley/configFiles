# dotfiles

### using dotbot heavily

note that some fuckery employed to allow multiple dotfiles in same repo without separate branches

branches are shit because it's not always clear whether a commit should be in base or on a secondary branch, resulting in much cherry-picking/rebasing and force pushing

the current solution is prett bad though

separate conf files for different computers

hosts/hostFilesGen.fish containss the skeletons

it makes copies of files that are different using totally non-fragile regexes, which the above conf files link

maybe i should rethink this lmao

