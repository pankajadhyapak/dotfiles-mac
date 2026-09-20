#!/usr/bin/env bash

data=$(curl -s --max-time 10 'wttr.in/Berlin?format=%t')
# an unreachable endpoint returned an empty string and blanked the item,
# so keep the last good reading instead
case "$data" in
  "" | *nknown* | *html*) exit ;;
esac
sketchybar --set "$NAME" icon="􀇔" label="$data" icon.color=0xffd19a66 label.color=0xffd19a66
