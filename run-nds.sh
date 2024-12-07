#!/bin/bash

root_path=$(dirname "$(readlink -f "$0")")
cd "$root_path"
git fetch origin
git reset --hard origin/main
~/Downloads/melonDS/build/melonDS
git status
git add -A
git commit -m "Push game sav."
git push --force
