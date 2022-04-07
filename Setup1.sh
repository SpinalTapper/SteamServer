#!/bin/bash

############################################
# Setup Bare-Metal Install {Debian/Ubuntu} #
############################################

#run as root

NC='\033[0m' #No Colour
Red='\033[0;31m'
Green='\033[0;32m'
Blue='\033[0;34m'
Purple='\033[0;35m'

apt update -y

apt-get update -y

apt upgrade -y

apt-get upgrade -y

echo -e  "${Green}System is up to date${NC}"

apt-get install tcpdump -y

echo -e "${Blue}tcpdump installed and setup${NC}"

useradd -m steam

passwd steam

-u steam -s

if [ -d /home/steam/ ]
then
    cd /home/steam/
else
    mkdir /home/steam/
    cd /home/steam/
fi

add-apt-repository multiverse

echo -e  "${Blue}multiple CPU archicture installed${NC}"

dpkg --add-architecture i386

apt update -y

apt install libsdl2-2.0-0:i386

echo -e  "${Blue}32-bit libraries installed${NC}"

apt install lib32gcc-s1 steamcmd

echo -e  "${Blue}32-bit c compiler installed${NC}"

apt install steamcmd

echo -e "${Blue}installed steamcmd${NC}"

ln -sf /usr/games/steamcmd /home/steam/steamcmd

cd /home/steam/

if [ -d /home/steam/csgo-server/ ]
then
    echo "${Blue}Directory has been setup${NC}"
else
    mkdir /home/steam/csgo-server/
fi

#Commands for Steam Bare Metal [CfSBM]

cd /home/steam/csgo-server/

touch CfSBM.txt

echo -e "force_install_dir /home/steam/csgo-server/\nlogin anonymous\napp_update 740 validate\nquit" > CfSBM.txt

/usr/games/steamcmd +runscript /home/steam/csgo-server/CfSBM.txt

echo -e "${Green}Steam CMD and Server Requirements have been setup.${Red}\n\n${RED}Please Alter Config Files in directory ./steam/csgo/cfg autoexec.cfg${NC}"

#Now please run the second script
