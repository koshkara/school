#!/bin/bash
. ./functions.sh
. ./data.sh

if [ $# != 4 ] || [[ "$1" != *[0-9]* ]] || [[ "$2" != *[0-9]* ]] || [[ "$3" != *[0-9]* ]] || [[ "$4" != *[0-9]* ]] \
  || [ "$1" -gt 6 ] || [ "$1" -lt 1 ] || [ "$2" -gt 6 ] || [ "$2" -lt 1 ] || [ "$3" -gt 6 ] || \
  [ "$3" -lt 1 ] || [ "$4" -gt 6 ] || [ "$4" -lt 1 ]
then
  echo "Wrong input"
  elif [ "$1" -eq "$2" ] || [ "$3" -eq "$4" ]
  then
    echo "The font colour and the background are the same. Please, try again."
    else
      param_nam_back=$(color_back "$1")
      param_nam_font=$(color_font "$2")
      param_val_back=$(color_back "$3")
      param_val_font=$(color_font "$4")
      color_print "$param_nam_back" "$param_nam_font" "$param_val_back" "$param_val_font" "$data"
fi

