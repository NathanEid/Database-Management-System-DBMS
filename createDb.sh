#!/bin/bash

typeset -i flag
flag=0
#echo -e $'\e[44mThe names must only consist of the letters a to z \n(both in lower and upper case) without useing spaces,\nthe numbers 0 to 9 but not in the beging, and the underscore (_) symbol.\n\e[0m'
zenity --info --title="Naming instructions" --text=$'The names must only consist of the letters a to z \n(both in lower and upper case) without useing spaces,\nthe numbers 0 to 9 but not in the beging, and the underscore (_) symbol.' --no-wrap
echo -e "\e[44mPlease Enter Database name: \e[0m"
read dbname

if [[ $dbname != *" "* ]]; then

    #loop to check if the name is exist or not
    if [[ $(ls -F | grep /) != "" ]]; then

        for i in $(ls -F | grep /); do
            if [[ $i = "$dbname/" ]]; then
                echo -e "\e[41mDatabase is Exist\e[0m"
                flag=0
                break
            else
                flag=$flag+1
            fi
        done

        if [[ $flag != 0 ]]; then
            if [[ $(. checkValidName.sh "$dbname") = "True" ]]; then
                mkdir $PWD/$dbname
                echo -e "\e[44mDataBase Created Successfuly.\e[0m"
                notify-send -t 5000 -i face-smile "Congratulation" "Database <b>$dbname</b> Created"
            else
                echo -e "\e[41mRejected Name, Please modify it.\e[0m"
            fi
        fi

    else

        if [[ $flag = 0 ]]; then
            if [[ $(. checkValidName.sh "$dbname") = "True" ]]; then
                mkdir $PWD/$dbname
                echo -e "\e[44mDataBase Created Successfuly.\e[0m"
                notify-send -t 5000 -i face-smile "Congratulation" "Database <b>$dbname</b> Created"
            else
                echo -e "\e[41mRejected Name, Please modify it.\e[0m"
            fi
        fi
    fi

else

    echo -e "\e[41mRejected Name, Please modify it.\e[0m"
fi

echo ""
. mainMenu.sh
