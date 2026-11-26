#!/usr/bin/env sh

BATT=$(pmset -g batt)
PCT=$(echo "$BATT" | grep -Eo '[0-9]+%' | tr -d '%')
[ -z "$PCT" ] && exit 0   # no battery (desktop Mac)

# "; charging;" not "charging": "discharging" contains it.
case "$BATT" in
  *"; charging;"*) ICON="􀋦 " ;;
  *) ICON="" ;;
esac

if [ "$PCT" -lt 20 ]; then
  COLOR=0xffe06c75   # red
else
  COLOR=0xffffffff
fi

sketchybar --set $NAME label="$ICON$PCT%" label.color=$COLOR
