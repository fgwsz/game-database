#!/bin/bash

root_path=$(dirname "$(readlink -f "$0")")
git_fc_fcs="$root_path/FC/fcs/"
git_fc_sav="$root_path/FC/sav/"
sys_fc_fcs=~/.fceux/fcs/
sys_fc_sav=~/.fceux/sav/

cd "$root_path"
git fetch origin
git reset --hard origin/main
rsync -avzh --delete "$git_fc_fcs" "$sys_fc_fcs"
rsync -avzh --delete "$git_fc_sav" "$sys_fc_sav"
fceux
rsync -avzh --delete "$sys_fc_fcs" "$git_fc_fcs"
rsync -avzh --delete "$sys_fc_sav" "$git_fc_sav"
git status
git add -A
git commit -m "Push game sav."
git push --force
