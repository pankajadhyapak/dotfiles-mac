#!/usr/bin/env bash
# One tag item: $1 is the tag number (1-9). Same look as aerospace.sh.
# VIEW and OCCUPIED are bitmasks. They come with the tagwm_update event; on load or reload read them
# from tagwm's state file (plain lines, never sourced: TITLE in it is untrusted text).

STATE="$HOME/Library/Application Support/tagwm/state"
get() { grep "^$1=" "$STATE" 2>/dev/null | cut -d= -f2-; }
VIEW=${VIEW:-$(get VIEW)}
OCCUPIED=${OCCUPIED:-$(get OCCUPIED)}
VIEW=${VIEW//[!0-9]/}         # keep the arithmetic numeric whatever the file holds
OCCUPIED=${OCCUPIED//[!0-9]/}
BIT=$((1 << ($1 - 1)))

LABEL_COLOR=0xffffffff
SELECTED="false"
if (( ${VIEW:-0} & BIT )); then
  LABEL_COLOR=0xff000000
  SELECTED="true"
fi

LABEL=" "
if (( ${OCCUPIED:-0} & BIT )); then
  LABEL="▪"
fi

sketchybar --set "$NAME" label="$LABEL" label.y_offset=8 label.highlight=$SELECTED \
  background.drawing=$SELECTED label.color=$LABEL_COLOR icon.color=$LABEL_COLOR label.highlight_color=$LABEL_COLOR
