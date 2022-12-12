#!/bin/bash

#echo -e $'\e[44mThe names must only consist of the letters a to z \n(both in lower and upper case) without useing spaces,\nthe numbers 0 to 9 but not in the beging, and the underscore (_) symbol.\n\e[0m'
zenity --info --title="Naming instructions" --text=$'The names must only consist of the letters a to z \n(both in lower and upper case) without useing spaces,\nthe numbers 0 to 9 but not in the beging, and the underscore (_) symbol.' --no-wrap
echo -e "\e[44mPlease enter the table's name.\e[0m"
read dbtable

if [[ $dbtable != *" "* ]]; then

	if [[ -e "$dbtable.meta" ]]; then
		echo -e "\e[41mThere is a table with this name\e[0m"
	else
		if [[ $(. checkValidName.sh "$dbtable") = "True" ]]; then
			touch $dbtable.data
			touch $dbtable.meta
			echo -e "\e[44mSuccessful creation of table.\e[0m"
			notify-send -t 5000 -i face-smile "Congratulation" "Table <b>$dbtable</b> Created"
			. setMeta.sh
		else
			echo -e "\e[41mRejected Name, Please modify it.\e[0m"
		fi
	fi

else
	echo -e "\e[41mRejected Name, Please modify it.\e[0m"
fi

echo ""
. tablesMenu.sh
