#!/bin/bash
echo "This is my iptables configuration script."
echo "Current iptables chains and rules:"
iptables -S
read -p  "Flush all chains & rules [yes/n]? " user_input
if [[ "$user_input" == "yes" ]]; then
echo "Will start flushing ..."
iptables -F
iptables -P INPUT ACCEPT
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT
echo "... flushing completed ..."
fi
