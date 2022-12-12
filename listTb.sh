#!/bin/bash

typeset -i flag
flag=0

typeset -i num
num=0

if [[ $(ls -l | wc -l) = 1 ]]; then
    echo -e "\e[41mThere are no Tables here please Create your Tables.\e[0m"
else
    for i in $(ls | grep .data); do
        if [ -f $i ]; then
            echo $i
            num=$num+1
        else
            flag=$flag+1
        fi
    done

    if [[ $flag != 0 && $num = 0 ]]; then
        echo -e "\e[41mThere are no Tables here please Create your Tables.\e[0m"
    fi

fi

echo ""
. tablesMenu.sh
