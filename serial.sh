#!/bin/bash
echo "Serial Number Script"
echo "Enter your name:"
read USER_NAME
FILE_NAME="Serial_${USER_NAME// /_}_$(date +%Y%m%d%H%M%S).txt"
#FILE_NAME="Stefan_$USER_NAME"
touch "/home/pi/${FILE_NAME}"
cat /sys/class/net/wlan0/address >> $FILE_NAME
cat /proc/cpuinfo | grep Serial | cut -d ' ' -f 2 >> $FILE_NAME
