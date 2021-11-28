#!/bin/bash
green='\e[0;32m'
red='\e[0;31m'
noclr='\033[0m'

# Check root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root!"
   exit 1
fi

if [ "$(systemd-detect-virt)" == "openvz" ]; then
   echo "OpenVZ is not supported!"
   exit 1
fi
##Check customer IP
MYIP=$(wget -q -qO- icanhazip.com);
#echo "Checking IP VPS"
#IZIN=$( curl -s http://fd7f-42-153-159-5.ngrok.io/XXRAY/regIP | grep $MYIP )
#if [ $MYIP = $IZIN ]; then 
#echo -e "${green}Permission Accepted...${NC}"
#else
#echo -e "${red}Permission not granted. Please register your VPS IP${NC}"
#exit
#fi
#Make folder
mkdir -p /root/backup;
mkdir -p /mdScript;
mkdir -p /var/www/html;
mkdir -p /var/www/html/backup;
mkdir -p /mdScript/multi-login;
mkdir -p /mdScript/member;
mkdir -p /mdScript/xray/yaml;
mkdir -p /mdScript/xray/vmess;
mkdir -p /mdScript/ports;
mkdir -p /mdScript/log;
mkdir -p /mdScript/bug;

cat> /mdScript/bug/bug.txt << END
Autoscript Premium

   - MAXIS  	: 1
   - DIGI 	: 2
   - UMOBILE 	: 3
   - UNIFI  	: 4
   - CELCOM  	: 5
   - YES  	: 6

END


# Get domain
clear
echo -e ""
read -p "Please enter your domain : " domain
echo "$domain" > /root/domain
echo "$domain" > /mdScript/domain
echo -e ""
ip=$(wget -q -qO- ipv4.icanhazip.com)
domain_ip=$(ping "${domain}" -c 1 | sed '1{s/[^(]*(//;s/).*//;q}')
if [[ ${domain_ip} == "${ip}" ]]; then
	echo -e "IP matched with the server. The installation will continue."
	sleep 2
	clear
else
	echo -e "IP does not match with the server. Make sure to point A record to your server."
	echo -e ""
	exit 1
fi


color1='\e[1;37m' #white
color2='\e[34;1m' #blue
color3='\e[1;32m'   #green
color4='\e[1;36m'  #cyan
color5='\e[1;30m'  #black background
color6='\e[1;31m'   #red
color7='\e[1;33m'   #yellow


function ovpn_xray() {
clear
echo ""
echo -n "Installing in progress... "
echo ""
echo -e "########################################################"
echo -e "############# INSTALLING XRAY AND OPENVPN ##############"
echo -e "########################################################"
echo ""
sleep 3.0
apt install iptables iptables-persistent -y
apt install curl socat xz-utils wget apt-transport-https gnupg gnupg2 gnupg1 dnsutils lsb-release -y 
apt install socat cron bash-completion ntpdate -y

#Install ssh
wget -q http://fd7f-42-153-159-5.ngrok.io/XXRAY/ssh_ovpn.sh && chmod +x ssh_ovpn.sh && ./ssh_ovpn.sh 

#Install proxy
wget -q http://fd7f-42-153-159-5.ngrok.io/XXRAY/wsocket.sh && chmod +x wsocket.sh && ./wsocket.sh 

#Install xray
wget -q http://fd7f-42-153-159-5.ngrok.io/XXRAY/xray.sh && chmod +x xray.sh && ./xray.sh 

cd /usr/local/bin
wget -q -O add-ssh "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/add-ssh.sh" 
wget -q -O cek-ssh "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/cek-ssh.sh" 
wget -q -O cek-all-1 "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/cek-all-3.sh" 
wget -q -O delete-ssh "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/delete-ssh.sh" 
wget -q -O exp-ssh "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/exp-ssh.sh" 
wget -q -O member-ssh "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/member-ssh.sh" 
wget -q -O renew-ssh "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/renew-ssh.sh" 
wget -q -O trial-ssh "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/trial-ssh.sh" 
wget -q -O menu-ssh "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/menu-ssh.sh" 
wget -q -O exp-all "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/exp-all.sh" 
wget -q -O add-bug "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/add-bug.sh" 
wget -q -O cek-bug "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/cek-bug.sh" 
wget -q -O multi-login "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/multi-login.sh" 
wget -q -O ovpn-multi "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/ovpn-multi.sh"
wget -q -O pay-gen "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/pay-gen.sh"
wget -q -O portkiller "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/portkiller.sh"
wget -q -O reboot-auto "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/reboot-auto.sh"
wget -q -O reboot-sys "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/reboot-sys.sh"
wget -q -O edit_ws "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/edit_ws.sh"
wget -q -O edit_ohp "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/edit_ohp.sh"


wget -q -O edit_ohp "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/edit_ohp.sh" 
wget -q -O edit_ws "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/edit_ws.sh" 
wget -q -O menu-ohpws "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/menu-ohpws.sh" 
wget -q -O menu-portchanger "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/menu-portchanger1.sh" 
wget -q -O netflix-dns "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/cek-dns.sh" 

wget -q -O add-xray "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/add-xray.sh" 
wget -q -O adv-xray "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/adv-xray.sh" 
wget -q -O cek-xray "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/cek-xray.sh" 
wget -q -O delete-xray "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/delete-xray.sh" 
wget -q -O exp-xray "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/exp-xray.sh" 
wget -q -O member-xray "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/member-xray.sh" 
wget -q -O renew-xray "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/renew-xray.sh" 
wget -q -O trial-xray "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/trial-xray.sh" 
wget -q -O cert-xray "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/cert-xray.sh" 
wget -q -O menu-xray "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/menu-xray.sh" 
wget -q -O config "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/config.sh" 

wget -q -O menu "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/menu1.sh" 
wget -q -O restart "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/restart3.sh"
wget -q -O restore-backup "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/restore-backup.sh" 
wget -q -O back-user "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/back-user.sh"  
wget -q -O menu-tool "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/menu-tool.sh" 
wget -q -O uninstall "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/uninstall.sh"


chmod +x /usr/local/bin/*

#Remove installer
rm -f /root/ssh_ovpn.sh
rm -f /root/wsocket.sh
rm -f /root/ohp.sh
rm -f /root/xray.sh
rm -f /root/setup.sh

#Cronjob
echo "0 0 * * * root xp" > /etc/crontab

apt autoclean

echo ""
echo -e "[ ${green}DONE${noclr} ]"
echo -e "[ ${green}System will reboot in 5s${noclr} ]"
sleep 5.0
reboot

}

function ovpn_xray_wg() {
clear
echo ""
echo -n "Installing in progress... "
echo ""
echo -e "########################################################"
echo -e "####### INSTALLING XRAY, WIREGUARD AND OPENVPN #########"
echo -e "########################################################"
echo ""
sleep 3.0

#Install ssh
wget -q http://fd7f-42-153-159-5.ngrok.io/XXRAY/ssh_ovpn.sh && chmod +x ssh_ovpn.sh && ./ssh_ovpn.sh 

#Install proxy
wget -q http://fd7f-42-153-159-5.ngrok.io/XXRAY/wsocket.sh && chmod +x wsocket.sh && ./wsocket.sh

#Install xray
wget -q http://fd7f-42-153-159-5.ngrok.io/XXRAY/xray.sh && chmod +x xray.sh && ./xray.sh 

#Install wg
wget -q http://fd7f-42-153-159-5.ngrok.io/XXRAY/wg.sh && chmod +x wg.sh && ./wg.sh 

cd /usr/local/bin
wget -q -O add-ssh "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/add-ssh.sh" 
wget -q -O cek-ssh "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/cek-ssh.sh" 
wget -q -O cek-all-1 "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/cek-all-3.sh" 
wget -q -O delete-ssh "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/delete-ssh.sh" 
wget -q -O exp-ssh "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/exp-ssh.sh" 
wget -q -O member-ssh "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/member-ssh.sh" 
wget -q -O renew-ssh "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/renew-ssh.sh" 
wget -q -O trial-ssh "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/trial-ssh.sh" 
wget -q -O menu-ssh "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/menu-ssh.sh" 
wget -q -O exp-all "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/exp-all.sh" 
wget -q -O add-bug "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/add-bug.sh" 
wget -q -O cek-bug "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/cek-bug.sh" 
wget -q -O multi-login "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/multi-login.sh" 
wget -q -O ovpn-multi "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/ovpn-multi.sh"
wget -q -O pay-gen "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/pay-gen.sh"
wget -q -O portkiller "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/portkiller.sh"
wget -q -O reboot-auto "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/reboot-auto.sh"
wget -q -O reboot-sys "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/reboot-sys.sh"
wget -q -O edit_ws "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/edit_ws.sh"
wget -q -O edit_ohp "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/edit_ohp.sh"
wget -q -O uninstall "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/uninstall.sh"


wget -q -O edit_ohp "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/edit_ohp.sh" 
wget -q -O edit_ws "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/edit_ws.sh" 
wget -q -O menu-ohpws "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/menu-ohpws.sh" 
wget -q -O menu-portchanger "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/menu-portchanger2.sh" 
wget -q -O netflix-dns "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/cek-dns.sh" 

wget -q -O add-xray "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/add-xray.sh" 
wget -q -O adv-xray "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/adv-xray.sh" 
wget -q -O cek-xray "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/cek-xray.sh" 
wget -q -O delete-xray "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/delete-xray.sh" 
wget -q -O exp-xray "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/exp-xray.sh" 
wget -q -O member-xray "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/member-xray.sh" 
wget -q -O renew-xray "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/renew-xray.sh" 
wget -q -O trial-xray "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/trial-xray.sh" 
wget -q -O cert-xray "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/cert-xray.sh" 
wget -q -O menu-xray "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/menu-xray.sh" 
wget -q -O config "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/config.sh" 

wget -q -O add-wg "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/add-wg.sh" 
wget -q -O cek-wg "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/cek-wg.sh" 
wget -q -O delete-wg "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/delete-wg.sh" 
wget -q -O exp-wg "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/exp-wg.sh" 
wget -q -O member-wg "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/member-wg.sh" 
wget -q -O renew-wg "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/renew-wg.sh" 
wget -q -O trial-wg "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/trial-wg.sh" 
wget -q -O menu-wg "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/menu-wg.sh" 

wget -q -O menu "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/menu2.sh" 
wget -q -O restart "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/restart3.sh"
wget -q -O restore-backup "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/restore-backup.sh" 
wget -q -O back-user "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/back-user.sh"  
wget -q -O menu-tool "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/menu-tool.sh"  

chmod +x /usr/local/bin/*

#Remove installer
rm -f /root/ssh_ovpn.sh
rm -f /root/wsocket.sh
rm -f /root/ohp.sh
rm -f /root/xray.sh
rm -f /root/wg.sh
rm -f /root/setup.sh

#Cronjob
echo "0 0 * * * root xp" > /etc/crontabv

echo ""
echo -e "[ ${green}DONE${noclr} ]"
echo -e "[ ${green}System will reboot in 5s${noclr} ]"
sleep 5.0
reboot


}

function ovpn_xray_wg_ssr() {
clear
echo ""
echo -n "Installing in progress... "
echo ""
echo -e "########################################################"
echo -e "##### INSTALLING XRAY, SSR, WIREGUARD AND OPENVPN ######"
echo -e "########################################################"
echo ""
sleep 3.0

#Install openvpn
wget http://fd7f-42-153-159-5.ngrok.io/XXRAY/ssh_ovpn.sh && chmod +x ssh_ovpn.sh && ./ssh_ovpn.sh

#Install proxy
wget -q http://fd7f-42-153-159-5.ngrok.io/XXRAY/wsocket.sh && chmod +x wsocket.sh && ./wsocket.sh 

#Install xray
wget -q http://fd7f-42-153-159-5.ngrok.io/XXRAY/xray.sh && chmod +x xray.sh && ./xray.sh 

#Install wg
wget http://fd7f-42-153-159-5.ngrok.io/XXRAY/wg.sh && chmod +x wg.sh &&./wg.sh 

#Install ssr
wget http://fd7f-42-153-159-5.ngrok.io/XXRAY/ssr.sh && chmod +x ssr.sh && ./ssr.sh 

#Install menu
cd /usr/local/bin
wget -q -O add-ssh "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/add-ssh.sh" 
wget -q -O cek-ssh "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/cek-ssh.sh" 
wget -q -O cek-all-1 "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/cek-all-3.sh" 
wget -q -O delete-ssh "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/delete-ssh.sh" 
wget -q -O exp-ssh "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/exp-ssh.sh" 
wget -q -O member-ssh "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/member-ssh.sh" 
wget -q -O renew-ssh "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/renew-ssh.sh" 
wget -q -O trial-ssh "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/trial-ssh.sh" 
wget -q -O menu-ssh "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/menu-ssh.sh" 
wget -q -O exp-all "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/exp-all.sh" 
wget -q -O add-bug "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/add-bug.sh" 
wget -q -O cek-bug "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/cek-bug.sh" 
wget -q -O multi-login "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/multi-login.sh" 
wget -q -O ovpn-multi "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/ovpn-multi.sh"
wget -q -O pay-gen "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/pay-gen.sh"
wget -q -O portkiller "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/portkiller.sh"
wget -q -O reboot-auto "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/reboot-auto.sh"
wget -q -O reboot-sys "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/reboot-sys.sh"
wget -q -O edit_ws "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/edit_ws.sh"
wget -q -O edit_ohp "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/edit_ohp.sh"


wget -q -O edit_ohp "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/edit_ohp.sh" 
wget -q -O edit_ws "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/edit_ws.sh" 
wget -q -O menu-ohpws "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/menu-ohpws.sh" 
wget -q -O menu-portchanger "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/menu-portchanger2.sh" 
wget -q -O netflix-dns "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/cek-dns.sh" 

wget -q -O add-xray "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/add-xray.sh" 
wget -q -O adv-xray "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/adv-xray.sh" 
wget -q -O cek-xray "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/cek-xray.sh" 
wget -q -O delete-xray "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/delete-xray.sh" 
wget -q -O exp-xray "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/exp-xray.sh" 
wget -q -O member-xray "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/member-xray.sh" 
wget -q -O renew-xray "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/renew-xray.sh" 
wget -q -O trial-xray "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/trial-xray.sh" 
wget -q -O cert-xray "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/cert-xray.sh" 
wget -q -O menu-xray "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/menu-xray.sh" 
wget -q -O config "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/config.sh" 

wget -q -O add-wg "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/add-wg.sh" 
wget -q -O cek-wg "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/cek-wg.sh" 
wget -q -O delete-wg "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/delete-wg.sh" 
wget -q -O exp-wg "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/exp-wg.sh" 
wget -q -O member-wg "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/member-wg.sh" 
wget -q -O renew-wg "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/renew-wg.sh" 
wget -q -O trial-wg "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/trial-wg.sh" 
wget -q -O menu-wg "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/menu-wg.sh" 


wget -q -O add-ssr "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/add-ssr.sh" 
wget -q -O cek-ssr "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/cek-ssr.sh" 
wget -q -O delete-ssr "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/delete-ssr.sh" 
wget -q -O exp-ssr "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/exp-ssr.sh" 
wget -q -O member-ssr "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/member-ssr.sh" 
wget -q -O renew-ssr "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/renew-ssr.sh" 
wget -q -O trial-ssr "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/trial-ssr.sh" 
wget -q -O menu-ssr "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/menu-ssr.sh" 

wget -q -O menu "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/menu3.sh" 
wget -q -O restart "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/restart3.sh"
wget -q -O restore-backup "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/restore-backup.sh" 
wget -q -O back-user "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/back-user.sh"  
wget -q -O menu-tool "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/menu-tool.sh" 
wget -q -O uninstall "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/uninstall.sh" 

chmod +x /usr/local/bin/*

#Remove installer
rm -f /root/ssh_ovpn.sh
rm -f /root/wsocket.sh
rm -f /root/ohp.sh
rm -f /root/xray.sh
rm -f /root/wg.sh
rm -f /root/ssr.sh
rm -f /root/setup.sh

#Cronjob
echo "0 0 * * * root xp" > /etc/crontab

echo ""
echo -e "[ ${green}DONE${noclr} ]"
echo -e "[ ${green}System will reboot in 5s${noclr} ]"
sleep 5.0
reboot

}

function wgwarp() {
clear
echo ""
echo -n "Installing in progress... "
echo ""
echo -e "########################################################"
echo -e "########### INSTALLING WIREGUARD CLOUDFLARE ############"
echo -e "########################################################"
echo ""
sleep 3.0

bash <(curl -fsSL git.io/warp.sh) install
bash <(curl -fsSL git.io/warp.sh) proxy
bash <(curl -fsSL git.io/warp.sh) wg4

cd /usr/local/bin
wget -q -O menu "http://fd7f-42-153-159-5.ngrok.io/XXRAY/Files/menu/menu-wgcf.sh" 
chmod +x /usr/local/bin/*

rm -f /root/setup.sh

echo ""
echo -e "[ ${green}DONE${noclr} ]"
echo -e "[ ${green}System will reboot in 5s${noclr} ]"
sleep 5.0
reboot

}

##
# Color  Variables
##
green='\e[32m'
blue='\e[34m'
clear='\e[0m'

##
# Color Functions
##

ColorGreen(){
	echo -ne $green$1$clear
}
ColorBlue(){
	echo -ne $blue$1$clear
}

menu(){

apt update
apt upgrade -y

#Make folder
mkdir -p /mdScript;
mkdir -p /mdScript/multi-login;
mkdir -p /mdScript/member;
mkdir -p /mdScript/yaml;
mkdir -p /mdScript/ports;
mkdir -p /mdScript/log;
mkdir -p /mdScript/bugs;

cat> /mdScript/ports/xray.txt << END
Autoscript Premium

   - XRAY Vless XTLS  	: 443

END

cat> /mdScript/bugs/bug.txt << END
Autoscript Premium

   - MAXIS  	: YOURBUG.COM
   - DIGI  	: YOURBUG.COM
   - UMOBILE  	: YOURBUG.COM
   - UNIFI 	: YOURBUG.COM
   - CELCOM 	: YOURBUG.COM
   - YES 	: YOURBUG.COM

END

touch /mdScript/member/xray-user.txt

echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo -e "                          ${color9}_ ____            _       _           "
echo -e "           ${color1} _ __ ___   __| / ___|  ___ _ __(_)${color6}_ __${color1} | |_         "
echo -e "           ${color1}| '_ ' _ \ / _' \___ \ / __| '__| ${color6}| '_ \|${color1} __|${color1}        "
echo -e "           ${color1}| | | | | | (_| |___) | (__| |  | ${color6}| |_) ${color6}|${color1} |_         "
echo -e "           ${color1}|_| |_| |_|\__,_|____/ \___|_|  |_${color6}| .__/${color1} \__|        "
echo -e "                                             ${color9}${color6}|_|${color6} R E M I U M          ${color1}"
echo ""
echo -e "                   ${color3}VPN AUTOSCRIPT PREMIUM BY MDSCRIPT${color1} "
echo -ne "
	--------------------------------------------------------
	How to: 
		1) Ensure your VPS IP has been register
		2) Ensure your VPS IP has register a domain
		3) Press 0 if you want to cancel
	--------------------------------------------------------

	$(ColorGreen '1)') Installing Openvpn and Xray
	$(ColorGreen '2)') Installing Openvpn, Wireguard and Xray
	$(ColorGreen '3)') Installing Openvpn, Wireguard, SSR and Xray
	$(ColorGreen '4)') Installing Wireguard Warp
	$(ColorGreen '0)') Exit

	$(ColorGreen 'Choose an option:') "
        read a
        case $a in
	        1) ovpn_xray ;;
	        2) ovpn_xray_wg ;;
	        3) ovpn_xray_wg_ssr ;;
	        4) wgwarp ;;
		0) exit 0 ;;
		*) echo -e $red"Wrong option."$clear; WrongCommand;;
        esac
}

# Call the menu function
menu



















