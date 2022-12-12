#!/bin/bash

if [[ $val = "" ]]; then
	echo -e "\e[41minvalid entry, please enter a correct val\e[0m"

elif [[ $val =~ [/.:\|\-] ]]; then
	echo -e "\e[41mYou can't enter these characters => . / : - | \e[0m"

elif [[ $val =~ ^[a-zA-Z] ]]; then
	if [[ $((i + 1)) -lt $num_col ]]; then
		echo -n "$val" >>$dbtable.data
		echo -n ":" >>$dbtable.data
		out=false
	fi

	if [[ $((i + 1)) -eq $num_col ]]; then
		echo -n "$val" >>$dbtable.data
		echo "" >>$dbtable.data
		out=false
	fi
	out=false

else
	echo -e "\e[41mfield name can't start with numbers or special characters\e[0m"
fi
