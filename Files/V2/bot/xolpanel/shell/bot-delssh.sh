#!/bin/bash
read -p "Ketik Usernamenya : " user

if getent passwd $user > /dev/null 2>&1; then
        userdel $user > /dev/null 2>&1
        exp=$(grep -w "^### $user" "/etc/ssh/.ssh.db" | cut -d ' ' -f 3 | sort | uniq)
        sed -i "/^### $user $exp /,/^},{/d" /etc/ssh/.ssh.db
        rm -f /etc/ssh/$user
        rm -f /etc/fvstore/limit/ssh/ip/${user}
	    rm -f /var/www/html/ssh-$user.txt
        echo -e "Success"
	else
	gais
fi


