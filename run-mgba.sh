#!/bin/bash

root_path=$(dirname "$(readlink -f "$0")")
cd "$root_path"
git fetch origin
git reset --hard origin/main
mgba-qt
git add .
git commit -m "Push game sav."
git push
