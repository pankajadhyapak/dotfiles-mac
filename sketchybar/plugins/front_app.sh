#!/bin/sh

# Some events send additional information specific to the event in the $INFO
# variable. E.g. the front_app_switched event sends the name of the newly
# focused application in the $INFO variable:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

# $INFO is only exported by front_app_switched, so fall back on load/reload
APP_NAME=${INFO:-$(aerospace list-windows --focused --format "%{app-name}")}
# Ask aerospace for the field directly: splitting its table on "|" broke on
# titles that contain a pipe, and the tr that trimmed the column padding also
# stripped every space inside the title.
WINDOW_TITLE=$(aerospace list-windows --focused --format "%{window-title}")

if [ -z "$WINDOW_TITLE" ] || [ "$WINDOW_TITLE" = "$APP_NAME" ]; then
  LABEL="$APP_NAME"
else
  LABEL="$APP_NAME | $WINDOW_TITLE"
fi

if [ ${#LABEL} -gt 80 ]; then
  LABEL="$(echo "$LABEL" | cut -c 1-80)…"
fi

sketchybar --set "$NAME" label="$LABEL" icon.drawing=off
