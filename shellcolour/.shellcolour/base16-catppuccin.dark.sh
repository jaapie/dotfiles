#!/bin/sh
# Base16 Catppuccin Mocha - Shell color setup script
# https://github.com/catppuccin/catppuccin

if [ "${TERM%%-*}" = 'linux' ]; then
    # This script doesn't support linux console (use 'vconsole' template instead)
    return 2>/dev/null || exit 0
fi

color00="1e/1e/2e" # base
color01="f3/8b/a8" # red
color02="a6/e3/a1" # green
color03="f9/e2/af" # yellow
color04="89/b4/fa" # blue
color05="cb/a6/f7" # mauve
color06="94/e2/d5" # teal
color07="cd/d6/f4" # text
color08="45/47/5a" # surface1
color09=$color01   # red (bright)
color10=$color02   # green (bright)
color11=$color03   # yellow (bright)
color12=$color04   # blue (bright)
color13=$color05   # mauve (bright)
color14=$color06   # teal (bright)
color15="b4/be/fe" # lavender
color16="fa/b3/87" # peach
color17="f2/cd/cd" # flamingo
color18="18/18/25" # mantle
color19="31/32/44" # surface0
color20="58/5b/70" # surface2
color21="f5/e0/dc" # rosewater
color_foreground="cd/d6/f4" # text
color_background="1e/1e/2e" # base
color_cursor="cd/d6/f4"     # text

if [ -n "$TMUX" ]; then
  printf_template="\033Ptmux;\033\033]4;%d;rgb:%s\007\033\\"
  printf_template_var="\033Ptmux;\033\033]%d;rgb:%s\007\033\\"
  printf_template_custom="\033Ptmux;\033\033]%s%s\007\033\\"
elif [ "${TERM%%-*}" = "screen" ]; then
  printf_template="\033P\033]4;%d;rgb:%s\007\033\\"
  printf_template_var="\033P\033]%d;rgb:%s\007\033\\"
  printf_template_custom="\033P\033]%s%s\007\033\\"
else
  printf_template="\033]4;%d;rgb:%s\033\\"
  printf_template_var="\033]%d;rgb:%s\033\\"
  printf_template_custom="\033]%s%s\033\\"
fi

# 16 color space
printf $printf_template 0  $color00
printf $printf_template 1  $color01
printf $printf_template 2  $color02
printf $printf_template 3  $color03
printf $printf_template 4  $color04
printf $printf_template 5  $color05
printf $printf_template 6  $color06
printf $printf_template 7  $color07
printf $printf_template 8  $color08
printf $printf_template 9  $color09
printf $printf_template 10 $color10
printf $printf_template 11 $color11
printf $printf_template 12 $color12
printf $printf_template 13 $color13
printf $printf_template 14 $color14
printf $printf_template 15 $color15

# 256 color space
printf $printf_template 16 $color16
printf $printf_template 17 $color17
printf $printf_template 18 $color18
printf $printf_template 19 $color19
printf $printf_template 20 $color20
printf $printf_template 21 $color21

# foreground / background / cursor color
if [ -n "$ITERM_SESSION_ID" ]; then
  printf $printf_template_custom Pg cdd6f4 # foreground
  printf $printf_template_custom Ph 1e1e2e # background
  printf $printf_template_custom Pi cdd6f4 # bold color
  printf $printf_template_custom Pj 313244 # selection color
  printf $printf_template_custom Pk cdd6f4 # selected text color
  printf $printf_template_custom Pl cdd6f4 # cursor
  printf $printf_template_custom Pm 1e1e2e # cursor text
else
  printf $printf_template_var 10 $color_foreground
  printf $printf_template_var 11 $color_background
  printf $printf_template_var 12 $color_cursor
fi

# clean up
unset printf_template printf_template_var printf_template_custom
unset color00 color01 color02 color03 color04 color05 color06 color07
unset color08 color09 color10 color11 color12 color13 color14 color15
unset color16 color17 color18 color19 color20 color21
unset color_foreground color_background color_cursor
