  GNU nano 4.8                        iptables-conf.sh                                  
#!/bin/bash
echo "This is my iptables configuration script."
echo "Current iptables chains and rules:"
iptables -S
read -p  "Replace all chains & rules [yes/n]? " user_input
if [[ "$user_input" == "yes" ]]; then
echo "Will start flushing ..."
iptables -F
iptables -P INPUT ACCEPT
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT
echo "... flushing completed."
echo "Will start setting up custom chains & rules ..."
sudo iptables -A INPUT -i lo -j ACCEPT 
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -m conntrack --ctstate NEW -p udp --dport 53 -j ACCEPT
iptables -A INPUT -p tcp -s 10.10.10.166 --dport 22 -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -j REJECT
iptables -A INPUT -p tcp --dport ftp -j REJECT
iptables -A OUTPUT -o lo -j ACCEPT
echo "... setup completed."
echo "***********************************************"
echo "New iptables chains and rules:"
iptables -S
fi
