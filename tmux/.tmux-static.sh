#!/bin/sh
# Staticky edges for the tmux status bar, like the nvim statusline.
#
#   .tmux-static.sh       all edges: @static_session, @static_band,
#                         @static_userhost and @static_datetime get 3 to 6
#                         sextant characters that fade from dense next to their
#                         block to sparse away from it (run on every config load)
#   .tmux-static.sh win   only @static_win_left/right and @static_act_left/right,
#                         one character each either side of the current window
#                         and of windows with activity (run on every window
#                         switch, and by the full run)
#
# POSIX sh and awk only, so it works on macOS too.

awk -v seed="$(( $$ + $(date +%s) ))" -v mode="${1:-all}" '
BEGIN {
  srand(seed)
  # dense to sparse: full and shaded blocks, heavy sextants, light sextants, specks
  len = split("█ ▓ 🬻 🬺 🬷 🬯 ▒ 🬖 🬍 ░ 🬃 🬇 🬀 🬁 ⡀ ⠂ ·", set, " ")
  if (mode == "all") {
    # out: the static trails away to the right of its block
    # in:  the static builds up to the left of its block
    print "@static_session",  fade("out")
    print "@static_band",     fade("out")
    print "@static_userhost", fade("in")
    print "@static_datetime", fade("in")
  }
  # one character either side of the name of the current window
  print "@static_win_left",  set[1 + int(rand() * len)]
  print "@static_win_right", set[1 + int(rand() * len)]
  # and either side of windows flagged with activity
  print "@static_act_left",  set[1 + int(rand() * len)]
  print "@static_act_right", set[1 + int(rand() * len)]
}
function fade(dir,    n, i, idx, s) {
  n = 3 + int(rand() * 4)
  s = ""
  for (i = 0; i < n; i++) {
    idx = int(i * len / n) + int(rand() * 3) + 1
    if (idx > len) idx = len
    s = (dir == "out") ? s set[idx] : set[idx] s
  }
  return s
}' | while read -r option value; do
  tmux set -g "$option" "$value"
done
