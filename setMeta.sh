#!/bin/bash

echo -e "\e[44mEnter the number of columns you'd like to have.\e[0m"
read num_col

for ((i = 0; i < num_col; i++)); do
	out=true
	while $out; do
		echo -e "\e[44menter field $((i + 1)) name\e[0m"
		read field_name
		if [[ $field_name != *" "* ]]; then
			# valid entry
			if [[ $(. checkValidName.sh "$field_name") = "True" ]]; then
				echo -n "$field_name" >>$dbtable.meta
				echo -n ":" >>$dbtable.meta
				
				echo -e "\e[44mEnter filed data type.\e[0m"
				export PS3=$'\n\e[42mData Type>\e[0m '
				select choice in 'int' 'string'; do
					case $choice in
					'int')
						echo -n "int" >>$dbtable.meta
						break
						;;
					'string')
						echo -n "string" >>$dbtable.meta
						break
						;;
					*)
						eecho -e "\e[44mplease enter a valid choice.\e[0m"
						;;
					esac
				done
				
				echo -e "\e[44mDo you want it a primary key.\e[0m"
				export PS3=$'\n\e[42mPK>\e[0m '
				select choice in 'Yes' 'No'; do
					case $choice in
					'Yes')
						echo -n ":PK" >>$dbtable.meta
						break
						;;
					'No')
						break
						;;
					*)
						eecho -e "\e[44mplease enter a valid choice.\e[0m"
						;;
					esac
				done
				echo "" >>$dbtable.meta
				out=false
			
			else
				echo -e "\e[41mRejected Field Name, Please modify it.\e[0m"
			fi
		else
			echo -e "\e[41mRejected Field Name, Please modify it.\e[0m"
		fi
	done
done

export PS3=$'\n\e[42mTables Menu>\e[0m '
