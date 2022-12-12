#!/bin/bash

export PS3=$'\n\e[42mDatabase Menu>\e[0m '

select op in "Create Database" "List Databases" "Connect to Databases" "Drop Database" "Exit"; do
    case $op in
    "Create Database")
        . createDb.sh
        break
        ;;
    "List Databases")
        . listDb.sh
        break
        ;;
    "Connect to Databases")
        . connectDb.sh
        break
        ;;
    "Drop Database")
        . dropDb.sh
        break
        ;;
    "Exit")
        echo -e "\e[44mBye\e[0m"
        zenity --info --width=200 --title="BatServer" --text=$'Good Bye, We hope that we have helped you to get what you want, See you next time.\nBy\nMakarios Nassef\nNathan Eid' --no-wrap
        break
        ;;
    *)
        echo -e "\e[41mPlease select a reliable option.\e[0m"
        ;;
    esac
done
