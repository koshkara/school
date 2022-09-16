#!/bin/bash
. ./functions.sh
. ./data.sh
. ./color.conf

if [ -n "$1" ]
then
  echo "Wrong input"
    else
      default
      param_nam_back=$(color_back "$column1_background")
      param_nam_font=$(color_font "$column1_font_color")
      param_val_back=$(color_back "$column2_background")
      param_val_font=$(color_font "$column2_font_color")
      if [ -z "$param_nam_back" ] || [ -z "$param_nam_font" ] || [ -z "$param_val_back" ] \
      || [ -z "$param_val_font" ]
      then
        echo "Wrong input. You should use numbers from 1 to 6"
      else
      color_print "$param_nam_back" "$param_nam_font" "$param_val_back" "$param_val_font" "$data"
      echo
      colors=$(cat color.conf)
      color_print_conf "$param_nam_back" "$param_nam_font" "$param_val_back" "$param_val_font" "$colors"
fi
fi

