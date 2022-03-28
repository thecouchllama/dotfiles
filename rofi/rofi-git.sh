#!/bin/bash
set -euo pipefail

selector=$(find ~/git -maxdepth 3 -type d -name '.git' | sed 's|/.git||' | sed "s.$HOME\/git\/.." | rofi -dmenu -p "> " -mesg "Git Repos")

code ${HOME}/git/$selector
