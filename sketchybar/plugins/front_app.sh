#!/bin/sh

# Some events send additional information specific to the event in the $INFO
# variable. E.g. the front_app_switched event sends the name of the newly
# focused application in the $INFO variable:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

WINDOW_TITLE=$(aerospace list-windows --focused | awk -F\| '{ print $3 }' | tr -d ' ')
APP_NAME=$INFO
if [[ $WINDOW_TITLE = "" ]]; then
  WINDOW_TITLE=$INFO
fi

if [[ ${#WINDOW_TITLE} -gt 80 ]]; then
  WINDOW_TITLE=$(echo "$WINDOW_TITLE" | cut -c 1-80)
  sketchybar --set $NAME label="$APP_NAME | $WINDOW_TITLE"… icon.drawing=off
  exit 0
fi

sketchybar --set $NAME label="$APP_NAME | $WINDOW_TITLE" icon.drawing=off
