#!/bin/bash

jumlah=$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)
if [[ $jumlah != "0" ]];then
while read expired; do
    AKUN="$(echo $expired | cut -d: -f1)"
    ID="$(echo $expired | grep -v nobody | cut -d: -f3)"
    exp="$(chage -l $AKUN | grep "Account expires" | awk -F": " '{print $2}')"
    status="$(passwd -S $AKUN | awk '{print $2}')"
    if [[ $ID -ge 1000 ]]; then
    echo -e "$AKUN | $exp"
    fi
done </etc/passwd
else
garis
fi
