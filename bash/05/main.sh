#!/bin/bash
. ./functions.sh
. ./data.sh

if [ "$#" -ne 1 ]
then
  echo "Wrong input"
  elif ! [ -d "$1" ]
  then
    echo "It is not a directory"
    else
      echo "$data"
      echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
      echo "$big_list_1"
      echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
      echo "$big_list_2"
      printf "%s%.2f\n" "Script execution time (in seconds) = " "$time_script"
fi