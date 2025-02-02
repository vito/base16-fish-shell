# base16-fish-shell (https://github.com/FabioAntunes/base16-fish-shell)
# Inspired by base16-shell (https://github.com/chriskempson/base16-shell)
# Sagelight scheme by Carter Veldhuizen

function base16-sagelight -d "base16 Sagelight theme"
    set options (fish_opt --short=t --long=test)
    argparse $options -- $argv
    set padded_seq_values (seq -w 0 21)

    # colors
    set color00 "f8/f8/f8" # Base 00 - Black
    set color01 "fa/84/80" # Base 08 - Red
    set color02 "a0/d2/c8" # Base 0B - Green
    set color03 "ff/dc/61" # Base 0A - Yellow
    set color04 "a0/a7/d2" # Base 0D - Blue
    set color05 "c8/a0/d2" # Base 0E - Magenta
    set color06 "a2/d6/f5" # Base 0C - Cyan
    set color07 "38/38/38" # Base 05 - White
    set color08 "b8/b8/b8" # Base 03 - Bright Black
    set color09 $color01 # Base 08 - Bright Red
    set color10 $color02 # Base 0B - Bright Green
    set color11 $color03 # Base 0A - Bright Yellow
    set color12 $color04 # Base 0D - Bright Blue
    set color13 $color05 # Base 0E - Bright Magenta
    set color14 $color06 # Base 0C - Bright Cyan
    set color15 "18/18/18" # Base 07 - Bright White
    set color16 "ff/aa/61" # Base 09
    set color17 "d2/b2/a0" # Base 0F
    set color18 "e8/e8/e8" # Base 01
    set color19 "d8/d8/d8" # Base 02
    set color20 "58/58/58" # Base 04
    set color21 "28/28/28" # Base 06
    set color_foreground "38/38/38" # Base 05
    set color_background "f8/f8/f8" # Base 00

    # 16 color space
    __put_template 0  $color00
    __put_template 1  $color01
    __put_template 2  $color02
    __put_template 3  $color03
    __put_template 4  $color04
    __put_template 5  $color05
    __put_template 6  $color06
    __put_template 7  $color07
    __put_template 8  $color08
    __put_template 9  $color09
    __put_template 10 $color10
    __put_template 11 $color11
    __put_template 12 $color12
    __put_template 13 $color13
    __put_template 14 $color14
    __put_template 15 $color15

    # 256 color space
    __put_template 16 $color16
    __put_template 17 $color17
    __put_template 18 $color18
    __put_template 19 $color19
    __put_template 20 $color20
    __put_template 21 $color21

    # foreground / background / cursor color
    if test -n "$ITERM_SESSION_ID"
      # iTerm2 proprietary escape codes
      __put_template_custom Pg 383838 # foreground
      __put_template_custom Ph f8f8f8 # background
      __put_template_custom Pi 383838 # bold color
      __put_template_custom Pj d8d8d8 # selection color
      __put_template_custom Pk 383838 # selected text color
      __put_template_custom Pl 383838 # cursor
      __put_template_custom Pm f8f8f8 # cursor text

    else
      __put_template_var 10 $color_foreground
      if test "$BASE16_SHELL_SET_BACKGROUND" != false
        __put_template_var 11 $color_background
        if string match -q -- '*rxvt*' $TERM
          __put_template_var 708 $color_background # internal border (rxvt)
        end
      end
      __put_template_custom 12 ";7" # cursor (reverse video)
    end

    set -gx fish_color_autosuggestion "b8b8b8" brblack
    set -gx fish_pager_color_description "ffaa61" yellow

    __base16_fish_shell_set_background "f8" "f8" "f8"
    __base16_fish_shell_create_vimrc_background sagelight
    set -U base16_fish_theme sagelight

    if test -n "$_flag_t"
        set base16_colors
        for seq_value in $padded_seq_values
            set base16_colors $base16_colors $seq_value
        end
        set base16_colors $base16_colors

        __base16_fish_shell_color_test $base16_colors
    end
end
