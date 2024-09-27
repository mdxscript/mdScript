#!/bin/bash

if [ -e "/var/log/auth.log" ]; then
    LOG="/var/log/auth.log"
fi
if [ -e "/var/log/secure" ]; then
    LOG="/var/log/secure"
fi

echo "" > /root/ok
data=($(ps aux | grep -i dropbear | awk '{print $2}'))
cat $LOG | grep -i dropbear | grep -i "Password auth succeeded" >/tmp/login-db.txt
for PID in "${data[@]}"; do
    cat /tmp/login-db.txt | grep "dropbear\[$PID\]" > /tmp/login-db-pid.txt
    NUM1=$(cat /tmp/login-db-pid.txt | wc -l)
    USER=$(cat /tmp/login-db-pid.txt | awk '{print $10}' | tr -d "'")
    IP=$(cat /tmp/login-db-pid.txt | awk '{print $12}')
    if [ $NUM1 -eq 1 ]; then
	printf " %-10s %-10s %-10s \n" "$PID" "$USER" "$IP" | tee -a /root/ok
    fi
done

cat $LOG | grep -i sshd | grep -i "Accepted password for" >/tmp/login-db.txt
data=($(ps aux | grep "\[priv\]" | sort -k 72 | awk '{print $2}'))

for PID in "${data[@]}"; do
    cat /tmp/login-db.txt | grep "sshd\[$PID\]" >/tmp/login-db-pid.txt
    NUM2=$(cat /tmp/login-db-pid.txt | wc -l)
    USER=$(cat /tmp/login-db-pid.txt | awk '{print $9}' | tr -d "'")
    IP=$(cat /tmp/login-db-pid.txt | awk '{print $11}')
    if [ $NUM2 -eq 1 ]; then
	printf " %-10s %-10s %-10s \n" "$PID" "$USER" "$IP" | tee -a /root/ok
    fi
done
if [ -f "/etc/openvpn/server/openvpn-tcp.log" ]; then
    cat /etc/openvpn/server/openvpn-tcp.log | grep -w "^CLIENT_LIST" | cut -d ',' -f 2,3,8 | sed -e 's/,/      /g' >/tmp/vpn-login-tcp.txt
    cat /tmp/vpn-login-tcp.txt
fi


if [ -f "/etc/openvpn/server/openvpn-udp.log" ]; then
    cat /etc/openvpn/server/openvpn-udp.log | grep -w "^CLIENT_LIST" | cut -d ',' -f 2,3,8 | sed -e 's/,/      /g' >/tmp/vpn-login-udp.txt
    cat /tmp/vpn-login-udp.txt
fi

cek=$(cat /root/ok);
if [[ $cek == "" ]]; then
gais
fi
