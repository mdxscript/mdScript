#!/bin/bash
read -p "" user
if [[ $user != "" ]]; then
hari="1"
Pass=1
pup=30
iplimit=1
ISP=$(cat /etc/xray/isp)
CITY=$(cat /etc/xray/city)
tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $user
exp="$(chage -l $user | grep "Account expires" | awk -F": " '{print $2}')"
hariini=`date -d "0 days" +"%Y-%m-%d"`
expi=`date -d "$masaaktif days" +"%Y-%m-%d"`
echo -e "$Pass\n$Pass\n"|passwd $user &> /dev/null
mkdir -p /etc/ssh

if [[ ${c} != "0" ]]; then
  echo "${d}" >/etc/ssh/${user}
fi
DATADB=$(cat /etc/ssh/.ssh.db | grep "^###" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /etc/ssh/.ssh.db
fi
echo "### ${user} ${exp}" >>/etc/ssh/.ssh.db
echo "tunnel ssh ${user} ${exp}" | at now +$pup minutes &> /dev/null
else
gais
fi
