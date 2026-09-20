#!/usr/bin/env bash

WIN=$(aerospace list-windows --workspace $1 --count)
WIN=${WIN//[!0-9]/}   # keep -gt numeric even if aerospace errors out
# $FOCUSED_WORKSPACE is only exported by the event, so fall back on load/reload
FOCUSED_WORKSPACE=${FOCUSED_WORKSPACE:-$(aerospace list-workspaces --focused)}
LABEL_COLOR=0xffffffff
SELECTED="false"
args+=(--set $NAME )

if [ "$1" = "$FOCUSED_WORKSPACE" ];then
  LABEL_COLOR=0xff000000
  SELECTED="true"
fi

# echo $FOCUSED_WORKSPACE $1
if [ "${WIN:-0}" -gt 0 ];then
  args+=(label="▪")
else
  args+=(label=" " )
fi
args+=(label.y_offset=8 label.highlight=$SELECTED background.drawing=$SELECTED label.color=$LABEL_COLOR icon.color=$LABEL_COLOR label.highlight_color=$LABEL_COLOR)

sketchybar "${args[@]}"
