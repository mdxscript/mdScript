#!/bin/bash
#random
apt install jq curl -y
rm -rf /root/xray/scdomain
mkdir -p /root/xray
MYIP=$(curl -sS ipv4.icanhazip.com)
clear
echo ""
echo ""
read -rp "Input Domain Name  : " -e sub

SUB_DOMAIN=${sub}

echo "$SUB_DOMAIN" > /root/domain
echo "$SUB_DOMAIN" > /root/scdomain
echo "$SUB_DOMAIN" > /etc/xray/domain
echo "$SUB_DOMAIN" > /etc/v2ray/domain
echo "$SUB_DOMAIN" > /etc/xray/scdomain
echo "IP=$SUB_DOMAIN" > /var/lib/kyt/ipvps.conf
rm -rf cf
sleep 1
