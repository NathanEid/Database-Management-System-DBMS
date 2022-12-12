#!/bin/bash

if [[ $(ls -l | wc -l) = 1 ]]; then
	echo -e "\e[41mThere are no Tables here please Create your Tables.\e[0m"
else
	echo -e "\e[44mPlease enter the table name :\e[0m"
	read dbtable
	if [[ -f "$dbtable.data" ]]; then
		file=$dbtable.meta
		num_col=$(cat "$file" | wc -l)
		for ((i = 0; i < $num_col; i++)); do
			out=true
			while $out; do
				if [[ $(awk -F: '{print $2}' "$dbtable.meta" | head -n $((i + 1)) | tail -n 1) = "int" ]]; then
					echo "Enter a value Int for column" $(awk -F: '{print $1}' "$dbtable.meta" | head -n $((i + 1)) | tail -n 1)
					read val

					if [[ $(awk -F: '{print $3}' "$dbtable.meta" | head -n $((i + 1)) | tail -n 1) = "PK" ]]; then
						existpk=$(cut -d ':' -f1 "$dbtable.data" | grep -x -e "$val")
						if [[ "$existpk" == '' ]]; then
							. checkInt.sh
						else
							echo -e "\e[41mThis id is already exist.\e[0m"
						fi
					else
						. checkInt.sh
					fi
				else
					echo "Enter a value String for column" $(awk -F: '{print $1}' "$dbtable.meta" | head -n $((i + 1)) | tail -n 1)
					read val

					if [[ $(awk -F: '{print $3}' "$dbtable.meta" | head -n $((i + 1)) | tail -n 1) = "PK" ]]; then
						existpk=$(cut -d ':' -f1 "$dbtable.data" | grep -x -e "$val")
						if [[ "$existpk" == '' ]]; then
							. checkString.sh
						else
							echo -e "\e[41mThis id is already exist.\e[0m"
						fi
					else
						. checkString.sh
					fi
				fi
			done
		done

	else
		echo -e "\e[41mTable Not Exist\e[0m"
	fi
fi

echo ""
. tablesMenu.sh
