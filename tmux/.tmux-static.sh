#!/bin/sh
# Staticky edges for the tmux status bar, like the nvim statusline.
# Sets @static_session, @static_band, @static_userhost and @static_datetime to
# 3 to 6 sextant characters that fade from dense next to their block to sparse
# away from it. Run from .tmux.conf on every source, so each reload reshuffles.
# POSIX sh and awk only, so it works on macOS too.

awk -v seed="$(( $$ + $(date +%s) ))" '
BEGIN {
  srand(seed)
  # dense to sparse: full and shaded blocks, heavy sextants, light sextants, specks
  len = split("█ ▓ 🬻 🬺 🬷 🬯 ▒ 🬖 🬍 ░ 🬃 🬇 🬀 🬁 ⡀ ⠂ ·", set, " ")
  # out: the static trails away to the right of its block
  # in:  the static builds up to the left of its block
  print "@static_session",  fade("out")
  print "@static_band",     fade("out")
  print "@static_userhost", fade("in")
  print "@static_datetime", fade("in")
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
