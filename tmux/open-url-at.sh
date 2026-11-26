#!/bin/sh
# Open the URL at column $2 of line $1 (tmux #{mouse_line} and #{mouse_x}).
# Do nothing when the click is not on a URL.
url=$(printf '%s\n' "$1" | X="$2" perl -CSA -ne '
  while (/(https?:\/\/[^\s<>"\x27`]+)/g) {
    my ($s, $e, $u) = ($-[1], $+[1], $1);
    if ($ENV{X} >= $s && $ENV{X} < $e) {
      $u =~ s/[.,;:!?)\]]+$//;
      print $u;
      exit;
    }
  }')
[ -n "$url" ] && open "$url"
exit 0
