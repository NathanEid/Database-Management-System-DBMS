#!/bin/bash

if ! [[ $val =~ ^[0-9]+$ ]]; then
	echo -e "\e[41mNot a number\e[0m" >&2
else
	if [[ $((i + 1)) -eq $num_col ]]; then
		echo -n "$val" >>$dbtable.data
		echo "" >>$dbtable.data
		out=false
	fi

	if [[ $((i + 1)) -lt $num_col ]]; then
		echo -n "$val" >>$dbtable.data
		echo -n ":" >>$dbtable.data
		out=false
	fi
fi
