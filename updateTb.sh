#!/bin/bash

PK() {

    if [[ $(awk -F: '{if(NR == '$changex'){print $3}}' "$PWD/$tbname.meta") == "PK" ]]; then
        existpk=$(cut -d ':' -f$changex "$tbname.data" | grep -x -e "$newval")
        if [[ "$existpk" == '' ]]; then
            sed -i -e "s/$oldval/$newval/g" $PWD/$tbname.data
            echo -e "\e[44mUpdated Successfuly\e[0m"
            notify-send -t 5000 -i face-smile "Congratulation" "Data Updated Successfuly."
        else
			echo -e "\e[41mThis id is already exist.\e[0m"
        fi
    else
        sed -i -e "s/$oldval/$newval/g" $PWD/$tbname.data
        echo -e "\e[44mUpdated Successfuly\e[0m"
        notify-send -t 5000 -i face-smile "Congratulation" "Data Updated Successfuly."
    fi
}

if [[ $(ls -l | wc -l) = 1 ]]; then
    echo -e "\e[41mThere are no Tables here please Create your Tables.\e[0m"
else
    echo -e "\e[44mPlease Enter the name of Table you want to edit:\e[0m"
    read tbname

    if [[ -f "$tbname.data" ]]; then

        if [[ $(cat $tbname.data | wc -l) != 0 ]]; then

            fcolumn=$(awk ' BEGIN {FS=":"} { if(NR==1){print $1} }' "$tbname.meta")

            echo -e "\e[44mEnter The Record "$fcolumn" that you want to edit:\e[0m"
            read rec

            exist=$(cut -d ':' -f1 "$tbname.data" | grep -x -e "$rec")

            if ! [[ "$exist" == '' ]]; then

                echo -e "\e[44mWhat would you like to change?\e[0m"
                awk -F: '{print NR")", $1" ,"}' "$PWD/$tbname.meta" | tr '\n' ' '
                read -p "--> " changex
                #echo $changex
                sed -n "/^$rec/p" $PWD/$tbname.data | awk -F: '{ print "Old value is : "$'$changex'}'
                oldval=$(sed -n "/^$rec/p" $PWD/$tbname.data | awk -F: '{ print $'$changex'}')
                read -p "Enter New value :" newval

                if [[ $(awk -F: '{if(NR == '$changex'){print $2}}' "$PWD/$tbname.meta") == "int" ]]; then
                    if ! [[ $newval =~ ^[0-9]+$ ]]; then
	                    echo -e "\e[41mNot a number\e[0m" >&2
                    else
                        PK
                    fi
                else
                    if [[ $newval = "" ]]; then
                        echo -e "\e[41minvalid entry, please enter a correct val\e[0m"
                    elif [[ $newval =~ [/.:\|\-] ]]; then
                        echo -e "\e[41mYou can't enter these characters => . / : - | \e[0m"
                    elif [[ $newval =~ ^[a-zA-Z] ]]; then
                        PK
                    else
                        echo -e "\e[41mfield name can't start with numbers or special characters\e[0m"
                    fi
                fi
                
            else
                echo -e "\e[41mRecord not found\e[0m"
            fi
        else
            echo -e "\e[41mTable is empty.\e[0m"
        fi
    else
        echo -e "\e[41mTable Not Exist\e[0m"
    fi
fi

export PS3=$'\n\e[45mTables Menu>\e[0m '
echo ""
. tablesMenu.sh
