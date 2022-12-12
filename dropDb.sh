#!/bin/bash

typeset -i flag
flag=0

if [[ $(ls -F $PWD | grep /) = "" ]]; then
    echo -e "\e[41mThere are no Databases here please Create your Database.\e[0m"
else

    echo -e "\e[44mPlease Enter the name of DB you want to delete:\e[0m"
    read dbname

    for i in $(ls -F | grep /); do
        if [[ $i = "$dbname/" ]]; then
            rm -r $dbname
            echo -e "\e[44mDatabase Deleted.\e[0m"
            flag=0
            notify-send -t 5000 -i face-sad "Unfortunately" "Database <b>$dbname</b> deleted."
            break
        else
            flag=$flag+1
        fi
    done

    if [[ $flag != 0 ]]; then
        echo -e "\e[41mDataBase Not Exist.\e[0m"
    fi

fi

echo ""
. mainMenu.sh
