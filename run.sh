#!/bin/bash
for vpn in /proc/sys/net/ipv4/conf/*;
do 
	echo 0 > $vpn/accept_redirects;
 	echo 0 > $vpn/send_redirects;
done

cat <<EOF >> /etc/sysctl.conf
net.ipv4.conf.all.send_redirects=0
net.ipv4.conf.all.accept_redirects=0
net.ipv4.ip_forward=1
EOF

sysctl -e -p

TAB=$'\t'
sed -i "s/^${TAB}leftid=.*$/${TAB}leftid=${LEFT_PUB_IP}/g" /etc/ipsec.conf
sed -i "s/^${TAB}leftsubnet=.*$/${TAB}leftid=${LEFT_SUB_NET}/g" /etc/ipsec.conf
sed -i "s/^${TAB}right=.*$/${TAB}leftid=${RIGHT_PUB_IP}/g" /etc/ipsec.conf
sed -i "s/^${TAB}rightsubnet=.*$/${TAB}leftid=${RIGHT_SUB_NET}/g" /etc/ipsec.conf
echo "%any %any : PSK \"${SECRET}\"" > /etc/ipsec.secrets