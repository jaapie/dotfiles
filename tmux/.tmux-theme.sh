#!/bin/sh
# Status bar background from the current Omarchy theme's dark_background.
#
#   .tmux-theme.sh         set status-style on the running tmux server
#                          (run on every config load, and by the Omarchy
#                          theme-set hook so theme switches carry through)
#   .tmux-theme.sh print   print the style instead of setting it
#
# Falls back to the terminal's own background when there's no theme file
# (e.g. on macOS) or it has no usable dark_background.
# TMUX_THEME_COLORS overrides the colors.toml path (used by the tests).
#
# POSIX sh and awk only, so it works on macOS too.

colors="${TMUX_THEME_COLORS:-$HOME/.local/state/omarchy/current/theme/colors.toml}"

bg=$(awk -F'"' '
  /^[ \t]*dark_background[ \t]*=/ {
    if ($2 ~ /^#[0-9A-Fa-f]{6}$/) print tolower($2)
    exit
  }
' "$colors" 2>/dev/null)

style="bg=${bg:-default},fg=white"

if [ "$1" = print ]; then
  echo "$style"
else
  tmux set -g status-style "$style"
fi
