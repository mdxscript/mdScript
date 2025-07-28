How to
==========
#update and upgrade
pkg update && pkg upgrade -y

#allow access storage
termux-setup-storage 

#create bugscanner folder
mkdir -p /storage/emulated/0/Termux/bugscanner

cd /storage/emulated/0/Termux/bugscanner

#install wget
pkg install -y wget

#download file
wget -O $HOME/bugscan "https://raw.githubusercontent.com/mdxscript/mdscript/main/Files/Tools/bugscan"  &&
chmod +x bugscan && ./bugscan

Thats all...
