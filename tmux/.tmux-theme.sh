#!/bin/sh
# Status bar colours from the current Omarchy theme's colors.toml:
#   status-style    background is the theme's dark_background
#   @theme_current  the selected window's colour is the theme's orange
#
#   .tmux-theme.sh         set them on the running tmux server
#                          (run on every config load, and by the Omarchy
#                          theme-set hook so theme switches carry through)
#   .tmux-theme.sh print   print them instead of setting them
#
# Falls back to the terminal's own background and Catppuccin Mocha mauve
# when there's no theme file (e.g. on macOS) or a key is missing or not hex.
# TMUX_THEME_COLORS overrides the colors.toml path (used by the tests).
#
# POSIX sh and awk only, so it works on macOS too.

colors="${TMUX_THEME_COLORS:-$HOME/.local/state/omarchy/current/theme/colors.toml}"

# theme_colour <key>: the key's #rrggbb value in lower case, or nothing
theme_colour() {
  awk -F'"' -v key="$1" '
    $1 ~ "^[ \t]*" key "[ \t]*=" {
      if ($2 ~ /^#[0-9A-Fa-f]{6}$/) print tolower($2)
      exit
    }
  ' "$colors" 2>/dev/null
}

bg=$(theme_colour dark_background)
current=$(theme_colour orange)

style="bg=${bg:-default},fg=white"
current="${current:-#cba6f7}"

if [ "$1" = print ]; then
  echo "status-style $style"
  echo "@theme_current $current"
else
  tmux set -g status-style "$style" \; set -g @theme_current "$current"
fi
