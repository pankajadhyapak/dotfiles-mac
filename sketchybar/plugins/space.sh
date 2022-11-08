#!/usr/bin/env sh

WIN=$(yabai -m query --spaces --space $SID | jq '.windows[0]')
HAS_WINDOWS_OR_IS_SELECTED="true"
LABEL_COLOR=0xffffffff
args+=(--set $NAME )
if [ "$WIN" = "null" ] && [ "$SELECTED" = "false" ];then
  HAS_WINDOWS_OR_IS_SELECTED="false"
fi

if [ "$SELECTED" = "true" ];then
  LABEL_COLOR=0xff000000
fi

if [ "$WIN" != "null" ];then
  args+=(label="▪")
else
  args+=(label=" " )
fi

args+=(label.y_offset=8 label.highlight=$SELECTED background.drawing=$SELECTED label.color=$LABEL_COLOR icon.color=$LABEL_COLOR label.highlight_color=$LABEL_COLOR)

sketchybar "${args[@]}"
