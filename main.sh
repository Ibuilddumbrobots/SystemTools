#!/bin/bash

# Starter Code
command clear
echo "Welcome to system tools"
sleep 1
echo "For help please type in help in all lower case as for all commands"
sleep 1

while true
do
    echo "Command:"
    
    read command

    if [ "$command" == "wifiint" ];then
        ifconfig -a
    fi

    if [ "$command" == "update" ];then
        sudo apt update
    fi

    if [ "$command" == "mon" ];then
        echo "Turn Moniter Mode On or Off:"

        read on_off


        if [ "$on_off" == "off" ];then
            ifconfig -a
            echo "What is your interface:"
            read interface
            sudo airmon-ng stop $interface
            sudo service NetworkManager start
        fi
        if [ "$on_off" == "on" ];then
            ifconfig -a
            echo "What is your interface:"
            
            read interface

            sudo airmon-ng check kill
            sudo airmon-ng start $interface
        fi





    fi

    if [ "$command" == "macchanger" ];then
        ifconfig
        echo "What interface do you want to use"

        read interface

        ifconfig $interface down
        sudo macchanger -a $interface
        sudo ifconfig $interface up

    fi

    if [ "$command" == "help" ];then
        echo "macchanger, mon, update, wifiint"

    fi
done
