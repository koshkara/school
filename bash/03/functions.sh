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