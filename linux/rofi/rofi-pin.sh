#!/bin/bash
set -euo pipefail

selector=$(~/.local/bin/pinboard bookmarks | jq -r '.[] | .description[0:60] + "" + .tags + "" + .href' | column -t -s'' | rofi -dmenu -p "> " -mesg "All Bookmarks" -theme-str 'window {width: 75%;}')

xdg-open "$(echo $selector | awk '{print $NF}')"
