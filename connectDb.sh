#!/bin/bash

if [[ $(ls -F $PWD | grep /) = "" ]]; then
    echo -e "\e[41mThere are no Databases here please Create your Database.\e[0m"
    echo ""
    . mainMenu.sh
else
    echo -e "\e[44mPlease Enter the name of DB you want to Connect: \e[0m"
    read dbname

    for i in $(ls -F | grep /); do
        if [[ $i = "$dbname/" ]]; then
            cd $dbname
            echo -e "\e[44mDatabase $dbname Opend, the path: $PWD \e[0m"
            notify-send -t 5000 -i face-smile "Welcome to $dbname" "Database <b>$dbname</b> Opend"
            flag=0
            . tablesMenu.sh
            break
        else
            flag=$flag+1
        fi
    done

    if [[ $flag != 0 ]]; then
        echo -e "\e[41mDataBase Not Found.\e[0m"
        echo ""
        . mainMenu.sh
    fi

fi
