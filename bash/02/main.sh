#!/bin/bash
. ./functions.sh
. ./data.sh

if [ -n "$1" ]
then
  echo "Too many parameters"
  else
echo "$data"

echo "Writing the data to a file? (Y/N)"
read -N 1 answer

if [ "$answer" == "y" ] || [ "$answer" == "Y" ]
then
  name_data=$(date +%d_%m_%y_%H_%M_%S)
  touch ./"$name_data".status
  echo "$data" > "$name_data".status
  echo
  echo "The data writing to the file $name_data.status"
  elif [ "$answer" == "n" ] || [ "$answer" == "N" ]
  then
    echo
    exit
  else
    printf "\nWrong input\n"
    fi
fi