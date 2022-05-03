#!/bin/bash

#################################
# Start CS:GO Server Bare-Metal #
#################################

NC='\033[0m' #No Colour
Red='\033[0;31m'
Green='\033[0;32m'
Blue='\033[0;34m'
Purple='\033[0;35m'

echo -e "Have you enabled log on for logs in autoexec.cfg file, dir ./csgo/cfg [y/n]: "

read -n 1 -r ANS0

if [[ $ANS0 =~ ^[Yy]$ ]]
then
    echo -e "\nHave you got the Steam login token? If not, please retrieve from the Steam Website (available at https://steamcommunity.com/dev/managegameservers) [y/n]: "
    read  -n 1 -r ANS1
    if [[ $ANS1 =~ ^[Yy]$ ]]
    then
        while true
        do
            echo -e "\nIs it in a file [f] or do you want to type it in [t]? "
            read -n 1 -r ANS2
            if [[ $ANS2 =~ ^[Ff]$ ]]
            then
                echo -e "\nPlease put in your file location: "
                read fTOKEN
                TOKEN=$(cat ${fTOKEN})
                ./csgo-server/srcds_run -game csgo -console -usercon game_type 0 +game_mode 0 +mapgroup mg_active +map de_mirage +sv_setsteamaccount $TOKEN -port 27015
                break
            elif [[ $ANS2 =~ ^[Tt]$ ]]
            then
                echo -e "\nPlease enter your the Steam Token: "
                read tTOKEN
                ./csgo-server/srcds_run -game csgo -console -usercon -tickrate 128 +game_type 0 +game_mode 0 +mapgroup mg_active +map de_mirage +sv_setsteamaccount $tTOKEN -port 27015
                break
            else
                echo -e "${Red}\nPlease enter a valid option of file or token value${NC}"
            fi
        done
    else
        echo -e "${Red}\nPlease retrieve the login token${NC}"   
        exit 1
    fi

else
    echo -e "${Red}\nPlease edit the autoexec.cfg file${NC}"
    exit 1
fi
