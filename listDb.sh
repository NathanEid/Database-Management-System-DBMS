#!/bin/bash

if [[ $(ls -F $PWD | grep /) = "" ]]; then
    echo -e "\e[41mThere are no Databases here please Create your Database.\e[0m"
else
    ls -F $PWD | grep /
fi

echo ""
. mainMenu.sh
