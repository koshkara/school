#!/bin/bash

sudo timedatectl set-ntp true
sudo timedatectl set-timezone Europe/Moscow
timezone=$(timedatectl status | grep Time | awk '{print $3, $4, $5}')

os=$(hostnamectl | grep Operating | awk '{print $3, $4, $5}')

date=$(date | awk '{print $2, $3, $4, $5}')

uptime=$(uptime -p)

uptime_sec=$(cat /proc/uptime | awk '{print $1}')

ip=$(ip a | grep -m 1 inet | awk '{print $2}')

#sudo apt install ipcalc
mask=$(ipcalc $ip | grep Netmask | awk '{print $2}')

gateway=$(ip r | grep default | awk '{print $3}')

ram_total_kb=$(cat /proc/meminfo | grep -m 1 Total | awk '{print $2}')
ram_total_gb=$(convert gb "$ram_total_kb")

ram_used_kb=$(free | grep -m 1 Mem | awk '{print $3}')
ram_used_gb=$(convert gb "$ram_used_kb")

ram_free_kb=$(free | grep -m 1 Mem | awk '{print $4}')
ram_free_gb=$(convert gb "$ram_free_kb")

space_root_kb=$(df | grep '/$' | awk '{print $2}')
space_root_mb=$(convert mb "$space_root_kb")

space_root_used_kb=$(df | grep '/$' | awk '{print $3}')
space_root_used_mb=$(convert mb "$space_root_used_kb")

space_root_free_kb=$(df | grep '/$' | awk '{print $4}')
space_root_free_mb=$(convert mb "$space_root_free_kb")


data=$(print "$HOSTNAME" "$timezone" "$USER" "$os" "$date" "$uptime" "$uptime_sec" "$ip" \
 "$mask" "$gateway" "$ram_total_gb" "$ram_used_gb" "$ram_free_gb" "$space_root_mb" \
 "$space_root_used_mb" "$space_root_free_mb")
