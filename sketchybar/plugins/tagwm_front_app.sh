#!/usr/bin/env bash
# Focused app and window title, from the tagwm_update event or, on load or reload, tagwm's state file.
# Same output as front_app.sh.

STATE="$HOME/Library/Application Support/tagwm/state"
get() { grep "^$1=" "$STATE" 2>/dev/null | cut -d= -f2-; }
APP_NAME=${APP:-$(get APP)}
WINDOW_TITLE=${TITLE:-$(get TITLE)}

if [ -z "$WINDOW_TITLE" ] || [ "$WINDOW_TITLE" = "$APP_NAME" ]; then
  LABEL="$APP_NAME"
else
  LABEL="$APP_NAME | $WINDOW_TITLE"
fi

if [ ${#LABEL} -gt 80 ]; then
  LABEL="${LABEL:0:80}…"
fi

sketchybar --set "$NAME" label="$LABEL" icon.drawing=off
