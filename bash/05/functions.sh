#!/bin/bash

function print_list {
  IFS=$'\n'
      count=1
      for string in $1
      do
      echo "$count - $string"
      count=$((count+1))
      done
}


function convert {
  count=1
  size=()
  IFS=$'\n'
  for string in $1
  do
  if [ "$string" -gt 500 ] && [ "$string" -lt 500000 ]
  then
  string_num=$(bc<<<"scale=2;$string/1024")
  size_mb=$(printf "%.2f%s\n" "$string_num" " MB")
  size+=("$size_mb")
  elif [ "$string" -gt 500000 ]
  then
  string_num=$(bc<<<"scale=2;$string/1048576")
  size_gb=$(printf "%.2f%s\n" "$string_num" "GB")
  size+=("$size_gb")
  else
  size_kb=$(printf "%.2f%s\n" "$string" " KB")
  size+=("$size_kb")
  fi
  done
#  echo "${size[*]}"
}

function find_path {
  path=()
  IFS=$'\n'
#  echo "$3"
#echo "$1"
#echo "$2"
  paths=$(echo "$1" | grep -c ':$')
#  echo "$paths"
  if [ "$paths" -eq 1 ]
  then
    for string in $2
    do
      if [ "$3" == "./" ]
      then
    path+=(".")
    else
      path+=("./.")
      fi
    done
    else
  for string in $2
  do
#    echo "$string"
    pattern=0
    count=1
    find_string=""
    number_string=$(echo "$string" | awk '{print $1}')
#    echo "$number_string"
    text_string=$(echo "$string" | awk '{print $2, $3}')
#    echo "$text_string"
#    pattern=$(printf "%6d\t%s" "$number_string" "$text_string")
    pattern="$string"
#    echo "$pattern"
    while [ -z "$find_string" ]
    do
    find_string=$(echo "$1" | grep -B "$count" "$pattern" | grep "$3" | awk '{print $2}')
    count=$((count+1))
    done
#    echo "$find_string"
    IFS=$":"
    for final_string in $find_string
    do
#      echo "$final_string"
    path+=("$final_string")
    done
    IFS=$'\n'
    done
    fi
#    echo "${path[*]}"
}

function type {
  IFS=$'\n'
  type=()
  for string in $1
  do
    IFS=$"."
    count=0
    for name in $string
    do
      count=$((count+1))
        done
        type+=("$name")
        done
#        echo "${type[*]}"
}

function full_name {
  IFS=$'\n'
  full_name=()
  count=0
  for name in $2
  do
    IFS=$'*'
    for name1 in $name
    do
#    echo "$name"
    true
    done
    IFS=$'|'
    for name2 in $name1
    do
      true
#    echo "$name2"
    done
    IFS=$'='
    for name3 in $name2
    do
      true
#      echo "$name3"
      done
    IFS=$'>'
    for name4 in $name3
    do
      true
#      echo "$name4"
    done
    IFS=$'@'
    for name5 in $name4
    do
      true
#      echo "$name5"
    done
    full_name+=("$(printf "%s""${path[$count]}/$name5")")
    count=$((count+1))
    done
#    echo "${full_name[*]}"
}

function sha_sum {
  sha=()
  IFS=$'\n'
  count=0
#  for (( count=0; count <10 ; count++ ))
#  do
if [ -z "${full_name[0]}" ]
  then
    true
    else
    while [ -n "${full_name[$count]}" ]
#    then
    do
#      echo "${full_name[$count]}"
    sha+=("$(shasum "${full_name[$count]}" | awk '{print $1}')")
    count=$((count+1))
#    else
#      break;
#      fi
    done
    fi
#    echo "${sha[*]}"
}


function print {
  echo "Total number of folders (including all nested ones) = $1"
  echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
  print_list "$2"
  echo "Total number of files = $3"
  echo "Number of:"
  echo "Configuration files (with the .conf extension) = $4"
  echo "Text files = $5"
  echo "Executables files = $6"
  echo "Log files (with the extension .log) = $7"
  echo "Archive files = $8"
  echo "Symbolic links = $9"
}

function print_big_list {

  if [ -z "${full_name[0]}" ]
  then
    echo "Nothing to show"
    else

  for (( count=0 ; count<10; count++ ))
      do
        if [ -n "${full_name[$count]}" ]
        then
#        printf "%2d%s%-50s%5s%5s\n" "$((count+1))" " - " "${full_name[$count]}"", " "${size[$count]}"", " "${type[count]}"
        echo "$((count+1)) - ${full_name[$count]}, ${size[$count]}, ${type[$count]}"
        else
          break;
          fi
        done
        fi
}

function print_big_list2 {

  if [ -z "${full_name[0]}" ]
    then
      echo "Nothing to show"
      else

  for (( count=0 ; count<10; count++ ))
      do
        if [ -n "${full_name[$count]}" ]
          then
#        printf "%2d%s%-50s%5s%5s\n" "$((count+1))" " - " "${full_name[$count]}"", " "${size[$count]}"", " "${type[count]}"
        echo "$((count+1)) - ${full_name[$count]}, ${size[$count]}, ${sha[$count]}"
        else
          break;
          fi
        done
        fi
}