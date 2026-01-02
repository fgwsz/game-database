#!/bin/bash

root_path=$(dirname "$(readlink -f "$0")")
cd "$root_path"
git fetch origin
git reset --hard origin/main
cp -rf ./FC/cfs/* ~/.fceux/cfs/
cp -rf ./FC/sav/* ~/.fceux/sav/
fceux
cp -rf ~/.fceux/cfs/* ./FC/cfs/
cp -rf ~/.fceux/sav/* ./FC/sav/
git status
git add -A
git commit -m "Push game sav."
git push --force
