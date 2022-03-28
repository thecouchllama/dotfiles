#!/bin/bash
set -euo pipefail

selector=$(find ~/exercism -maxdepth 2 -mindepth 2 -type d -printf "\n%Cs %p" | sort -r | awk '{print $2}' | sed "s.$HOME\/exercism\/.." | tr "/" "\t" | rofi -dmenu -p "> " -mesg "Lang    Challenge")

code ${HOME}/exercism/$(echo $selector | tr " " "/")
