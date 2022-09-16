#!/bin/bash
if [ -n "$1" ]
then
param=$1
shift
if [ -n "$1" ]
then
echo "Too many parameters"
elif [[ $param != *[0-9]* ]]
then echo "$param"
else
echo "Wrong input"
fi
else
echo "Too few parameters"
fi
