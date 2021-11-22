#!/bin/bash
echo "Serial Number Script"
echo "Enter your full name:"
read USER_NAME
FILE_NAME="Serial_${USER_NAME// /_}_$(date +%Y%m%d%H%M%S).txt"
touch "/home/pi/${FILE_NAME}"
MODEL_NAME=$(tr -d '\0' < /proc/device-tree/model)
printf "User:           $USER_NAME\n" >> $FILE_NAME
printf "Device Model:   $MODEL_NAME\n" >> $FILE_NAME
printf "$(lsb_release -d)\n" >> $FILE_NAME
printf "Ethernet MAC:   $(cat /sys/class/net/eth0/address)\n" >> $FILE_NAME
printf "WiFi MAC:       $(cat /sys/class/net/wlan0/address)\n" >> $FILE_NAME
printf "CPU Serial No:  $(cat /proc/cpuinfo | grep Serial | cut -d ' ' -f 2)" >> $FILE_NAME
