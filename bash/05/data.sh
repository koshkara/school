#!/bin/bash
time_start=$(cat /proc/uptime | awk '{print $1}')
if [ -d "$1" ]
then
number_directory=$(sudo find "$1" -type d | wc -l |  awk '{print $1}')

folders_max_size=$(sudo du -h "$1" | sort -nr | grep -m 5 / | awk '{print $2", "$1}')

total_number_of_files=$(sudo find "$1" -type f | wc -l |  awk '{print $1}')

configuration_files=$(sudo find "$1" -type f -name "*.conf" | wc -l |  awk '{print $1}')

text_files=$(sudo find "$1" -type f -name "*.txt" | wc -l |  awk '{print $1}')

executable_files=$(sudo find "$1" -type f -executable | wc -l |  awk '{print $1}')

logs=$(sudo find "$1" -type f -name "*.log" | wc -l |  awk '{print $1}')

archives=$(sudo find "$1" -type f -name "*.tar" | wc -l |  awk '{print $1}')

links=$(sudo find "$1" -type l | wc -l |  awk '{print $1}')

data=$(print "$number_directory" "$folders_max_size" "$total_number_of_files" "$configuration_files" "$text_files" \
"$executable_files" "$logs" "$archives" "$links")


file_max_size_list=$(sudo ls -aBsv1RF "$1" | cat -b | grep -v "$1" | grep -v "total " | sort -k2nr | grep -m 10 -v '/$')
file_max_size_kb=$(echo "$file_max_size_list" | awk '{print $2}')
convert "$file_max_size_kb"
file_max_size_output=$(sudo ls -aBsv1RF "$1" | cat -b | grep -v '/$')
find_path "$file_max_size_output" "$file_max_size_list" "$1"
file_max_size_name=$(echo "$file_max_size_list" | awk '{print $3}')
full_name "${path[*]}" "$file_max_size_name"
type "$file_max_size_name"

big_list_1=$(print_big_list)

full_name=()

executable_file_max_size_list=$(sudo ls -aBsv1RF "$1" | cat -b | grep -v "$1" | grep -v "total"| sort -k2nr | \
grep -m 10 '*$')
executable_file_max_size_kb=$(echo "$executable_file_max_size_list" | awk '{print $2}')
convert "$executable_file_max_size_kb"
executable_file_max_size_output=$(sudo ls -aBsv1RF "$1" | cat -b | grep -v '/$')
find_path "$executable_file_max_size_output" "$executable_file_max_size_list" "$1"
executable_file_max_size_name=$(echo "$executable_file_max_size_list" | awk '{print $3}')
full_name "${path[*]}" "$executable_file_max_size_name"
sha_sum "${full_name[*]}"

big_list_2=$(print_big_list2)

time_end=$(cat /proc/uptime | awk '{print $1}')

time_script=$(bc<<<"scale=2;$time_end-$time_start")

fi