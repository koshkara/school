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

function print {
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
