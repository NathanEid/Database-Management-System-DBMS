#!/bin/bash

if [[ $(ls -l | wc -l) = 1 ]]; then
    echo -e "\e[41mThere are no Tables here please Create your Tables.\e[0m"
else
    echo -e "\e[44mPlease Enter the name of Table you want to delete:\e[0m"
    read tbname

    if [[ -f "$tbname.data" ]]; then
        rm "$tbname.data"
        rm "$tbname.meta"
        echo -e "\e[44mTable Deleted\e[0m"
        notify-send -t 5000 -i face-sad "Unfortunately" "Table <b>$tbname</b> deleted."
    else
        echo -e "\e[41mTable Not Exist\e[0m"
    fi
fi

echo ""
. tablesMenu.sh
