#!/bin/sh

# Credit:
# base16-shell (https://github.com/chriskempson/base16-shell)
# Base16 Shell template by Chris Kempson (http://chriskempson.com)
# Atelier Lakeside scheme by Bram de Haan (http://atelierbramdehaan.nl)

# This script doesn't support linux console (use 'vconsole' template instead)
if [ "${TERM%%-*}" = 'linux' ]; then
    return 2>/dev/null || exit 0
fi

color00="00/00/00" # Base 00 - Black
color01="b2/18/18" # Base 08 - Red
color02="11/80/11" # Base 0B - Green
color03="96/57/24" # Base 0A - Yellow
color04="60/40/a0" # Base 0D - Blue
color05="b2/18/b2" # Base 0E - Magenta
color06="14/96/96" # Base 0C - Cyan
color07="94/74/54" # Base 05 - White

color08="43/43/43" # Base 03 - Bright Black
color09="87/2e/30" # Base 08 - Bright Red
color10="36/a6/36" # Base 0B - Bright Green
color11="b3/67/00" # Base 0A - Bright Yellow
color12="70/50/c0" # Base 0D - Bright Blue
color13="c8/42/c8" # Base 0E - Bright Magenta
color14="30/94/94" # Base 0C - Bright Cyan
color15="b4/94/74" # Bright White

color16="93/5c/25" # Base 09
color17="b7/2d/d2" # Base 0F
color18="1f/29/2e" # Base 01
color19="51/6d/7b" # Base 02
color20="71/95/a8" # Base 04
color21="c1/e4/f6" # Base 06

color_foreground="5b/3c/11"
color_background="00/00/00"
color_cursor="5b/3c/11"

if [ -n "$TMUX" ]; then
  # Tell tmux to pass the escape sequences through
  # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
  printf_template='\033Ptmux;\033\033]4;%d;rgb:%s\033\033\\\033\\'
  printf_template_var='\033Ptmux;\033\033]%d;rgb:%s\033\033\\\033\\'
  printf_template_custom='\033Ptmux;\033\033]%s%s\033\033\\\033\\'
elif [ "${TERM%%-*}" = "screen" ]; then
  # GNU screen (screen, screen-256color, screen-256color-bce)
  printf_template='\033P\033]4;%d;rgb:%s\033\\'
  printf_template_var='\033P\033]%d;rgb:%s\033\\'
  printf_template_custom='\033P\033]%s%s\033\\'
else
  printf_template='\033]4;%d;rgb:%s\033\\'
  printf_template_var='\033]%d;rgb:%s\033\\'
  printf_template_custom='\033]%s%s\033\\'
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
  # iTerm2 proprietary escape codes
  printf $printf_template_custom Pg 7ea2b4 # forground
  printf $printf_template_custom Ph 161b1d # background
  printf $printf_template_custom Pi 7ea2b4 # bold color
  printf $printf_template_custom Pj 516d7b # selection color
  printf $printf_template_custom Pk 7ea2b4 # selected text color
  printf $printf_template_custom Pl 7ea2b4 # cursor
  printf $printf_template_custom Pm 161b1d # cursor text
else
  printf $printf_template_var 10 $color_foreground
  printf $printf_template_var 11 $color_background
  printf $printf_template_custom 12 ";7" # cursor (reverse video)
fi

# clean up
unset printf_template
unset printf_template_var
unset color00
unset color01
unset color02
unset color03
unset color04
unset color05
unset color06
unset color07
unset color08
unset color09
unset color10
unset color11
unset color12
unset color13
unset color14
unset color15
unset color16
unset color17
unset color18
unset color19
unset color20
unset color21
unset color_foreground
unset color_background
unset color_cursor
