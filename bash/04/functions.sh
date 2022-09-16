#!/bin/bash

function convert {
if [ "$1" == "gb" ]
then
value=$(bc<<<"scale=3;$2/1048576")
else
value=$(bc<<<"scale=2;$2/1024")
fi
echo "$value"
}

function color_font {
  case "$1" in
  1) add_text="\033[37m";;
  2) add_text="\033[31m";;
  3) add_text="\033[32m";;
  4) add_text="\033[34m";;
  5) add_text="\033[35m";;
  6) add_text="\033[30m";;
  esac
  echo "$add_text"
}

function color {
  case "$1" in
  1) color="white";;
  2) color="red";;
  3) color="green";;
  4) color="blue";;
  5) color="purple";;
  6) color="black";;
  esac
  echo "$color"
}


function color_back {
  case "$1" in
  1) add_text="\033[47m";;
  2) add_text="\033[41m";;
  3) add_text="\033[42m";;
  4) add_text="\033[44m";;
  5) add_text="\033[45m";;
  6) add_text="\033[40m";;
  esac
  echo "$add_text"
}

function default {
  if [ -z "$column1_background" ]
  then
    column1_background=4
    fi
  if [ -z "$column1_font_color" ]
  then
    column1_font_color=5
    fi
  if [ -z "$column2_background" ]
  then
    column2_background=5
    fi
  if [ -z "$column2_font_color" ]
  then
    column2_font_color=6
    fi
}

function print_data {
echo "HOSTNAME = $1"
echo "TIMEZONE = $2"
echo "USER = $3"
echo "OS = $4"
echo "DATE = $5"
echo "UPTIME = $6"
echo "UPTIME_SEC = $7"
echo "IP = $8"
echo "MASK = $9"
echo "GATEWAY = ${10}"
printf "RAM_TOTAL = %.3f GB\n" "${11}"
printf "RAM_USED = %.3f GB\n" "${12}"
printf "RAM_FREE = %.3f GB\n" "${13}"
printf "SPACE_ROOT = %.2f MB\n" "${14}"
printf "SPACE_ROOT_USED = %.2f MB\n" "${15}"
printf "SPACE_ROOT_FREE = %.2f MB\n" "${16}"
}


function color_print {
  IFS=$'\n'
  for string in $5
        do
          count=0
          IFS=$" "
          for word in $string
          do
            if [ "$count" -gt 2 ]
                      then
                        printf "%s" " "
                        fi
          if [ "$word" == "=" ]
          then
            printf " = "
            count=$((count+1))
              elif [ "$count" -gt 1 ]
            then
          printf "%s""$3""$4""$word""\033[0m"
          count=$((count+1))
          else
            printf "%s""$1""$2""$word""\033[0m"
            count=$((count+1))
            fi
          done
          echo
          count=1
          done
}


function color_print_conf {
  IFS=$'\n'
  count_string=1
  count_word=0
  count=0
  for string in $5
        do
          if [ $((count_string%2)) -eq 0 ]
                    then
                    where="font color"
                    else
                      where="background"
                    fi
          IFS=$"="
          for word in $string
          do
            count_word=$((count_word+1))
            if [ "$count" -eq 0 ]
            then
              if [ "$count_string" -gt 2 ]
              then
                count=$((count+1))
                fi
              count=$((count+1))
              printf "%s""$1""$2""Column ""$count"" $where""\033[0m = "
              else
                name_color=$(color "$word")
          printf "%s""$3""$4""$word"" ($name_color) ""\033[0m"
          echo
          fi
          done
          if [ $((count_word%2)) -ne 0 ]
          then
              case "$count_string" in
              1) word="$column1_background";;
              2) word="$column1_font_color";;
              3) word="$column2_background";;
              4) word="$column2_font_color";;
            esac
            name_color=$(color "$word")
            word="default"
            printf "%s""$3""$4""$word"" ($name_color) ""\033[0m"
            echo
            count_word=$((count_word+1))
          fi
          count_string=$((count_string+1))
          count=0
          done
}
