#!/usr/bin/env bash

# LABEL_COLOR=0xffffffff

# if  [ "$1" = "$FOCUSED_WORKSPACE" ]; then
#   LABEL_COLOR=0xff000000
# fi

# if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
#     sketchybar --set $NAME background.drawing=on label.highlight=on label.color=$LABEL_COLOR icon.color=$LABEL_COLOR label.highlight_color=$LABEL_COLOR
# else
#     sketchybar --set $NAME background.drawing=off label.highlight=on label.color=$LABEL_COLOR icon.color=$LABEL_COLOR label.highlight_color=$LABEL_COLOR
# fi

# sketchybar --set $NAME label="${FOCUSED_WORKSPACE-1}"

SELECTED="false"
LABEL_COLOR=0xffffffff
args+=(--set $NAME )
if [ "$1" = "$FOCUSED_WORKSPACE" ];then
  LABEL_COLOR=0xff000000
  SELECTED="true"
fi
args+=(label=" " )
args+=(label.y_offset=8 label.highlight=$SELECTED background.drawing=$SELECTED label.color=$LABEL_COLOR icon.color=$LABEL_COLOR label.highlight_color=$LABEL_COLOR)

sketchybar "${args[@]}"
