#!/bin/bash

root_path=$(dirname "$(readlink -f "$0")")
cd "$root_path"
git pull
mgba-qt
git add .
git commit -m "Push game sav."
git push
