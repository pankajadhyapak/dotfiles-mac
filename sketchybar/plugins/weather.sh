#!/usr/bin/env bash

data=$(curl -s 'wttr.in/Berlin?format=%t')
if [[ "$data" == *"nknown"* ]]; then
  exit
fi
if [[ "$data" == *"html"* ]]; then
  exit
fi
sketchybar --set weather icon="􀇔" label="$data" icon.color=0xffebcb8b label.color=0xffebcb8b
