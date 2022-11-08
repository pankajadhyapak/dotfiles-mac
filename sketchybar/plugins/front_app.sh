#!/bin/bash

WINDOW_TITLE=$(/opt/homebrew/bin/yabai -m query --windows --window | jq -r '.title')
APP_NAME=$(/opt/homebrew/bin/yabai -m query --windows --window | jq -r '.app')
if [[ $WINDOW_TITLE = "" ]]; then
  WINDOW_TITLE=$APP_NAME
fi

if [[ ${#WINDOW_TITLE} -gt 80 ]]; then
  WINDOW_TITLE=$(echo "$WINDOW_TITLE" | cut -c 1-80)
  sketchybar --set $NAME label="$APP_NAME | $WINDOW_TITLE"… icon.drawing=off
  exit 0
fi

sketchybar --set $NAME label="$APP_NAME | $WINDOW_TITLE" icon.drawing=off
