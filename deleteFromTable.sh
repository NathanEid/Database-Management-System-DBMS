#!/bin/bash

if [[ $(ls -l | wc -l) = 1 ]]; then
    echo -e "\e[41mThere are no Tables here please Create your Tables.\e[0m"
else
    echo -e "\e[44mPlease Enter the name of Table you want to delete from it:\e[0m"
    read tbname

    if [[ -f "$tbname.data" ]]; then

        if [[ $(cat $tbname.data | wc -l) != 0 ]]; then
            echo -e "\e[44mWhat is the way you want for delete?.\e[0m"
            export PS3=$'\n\e[42mBY>\e[0m '

            fcolumn=$(awk ' BEGIN {FS=":"} { if(NR==1){print $1} }' "$tbname.meta")

            select choice in 'All' "$fcolumn"; do
                case $choice in
                'All')
                    #echo "" > $dbtable.data;
                    rm $tbname.data
                    touch $tbname.data
                    echo -e "\e[44mAll Data Deleted\e[0m"
                    notify-send -t 5000 -i face-sad "Unfortunately" "All <b>$tbname</b> data deleted."
                    break
                    ;;
                "$fcolumn")
                    echo -e "\e[44mRecord "$fcolumn":\e[0m"
                    read rec
                    exist=$(cut -d ':' -f1 "$tbname.data" | grep -x -e "$rec")
                    if ! [[ "$exist" == '' ]]; then
                        sed -i "/^$rec/d" $PWD/$tbname.data
                        echo -e "\e[44mRecord Deleted\e[0m"
                        notify-send -t 5000 -i face-sad "Unfortunately" "Record data deleted."
                    else
                        echo -e "\e[41mRecord not found\e[0m"
                    fi
                    break
                    ;;
                *)
                    echo -e "\e[41mplease enter a valid choice\e[0m"
                    ;;
                esac
            done

        else
            echo -e "\e[41mTable Is Already Empty.\e[0m"
        fi
    else
        echo -e "\e[41mTable Not Exist\e[0m"
    fi
fi

export PS3=$'\n\e[45mTables Menu>\e[0m '

echo ""
. tablesMenu.sh
