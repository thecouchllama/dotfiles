#!/bin/bash
set -euo pipefail

selector=$(~/.local/bin/pinboard bookmarks | jq -r '.[] | select(.toread == "yes") | .description[0:60] + "" + .tags + "" + .href' | column -t -s'' | rofi -dmenu -p "> " -mesg "Read Later Bookmarks" -theme-str 'window {width: 75%;}')

xdg-open "$(echo $selector | awk '{print $NF}')"
