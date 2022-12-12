#!/bin/bash

export PS3=$'\n\e[45mTables Menu>\e[0m '
echo ""

select choice in 'Create Table' 'Insert into Table' 'Select From Table' 'Update to Table' 'Drop Table' 'List Tables' 'Delete From Table' 'Back to Master' 'Exit'; do
      case $choice in
      'Create Table')
            . createTb.sh
            break
            ;;
      'Insert into Table')
            . insertTb.sh
            break
            ;;
      'Select From Table')
            . selectTb.sh
            break
            ;;
      'Update to Table')
            . updateTb.sh
            break
            ;;
      'Drop Table')
            . dropTb.sh
            break
            ;;
      'List Tables')
            . listTb.sh
            break
            ;;
      'Delete From Table')
            . deleteFromTable.sh
            break
            ;;
      'Back to Master')
            cd ..
            . mainMenu.sh
            break
            ;;
      'Exit')
            echo -e "\e[44mBye\e[0m"
            zenity --info --width=200 --height=100 --title="BatServer" --text=$'Good Bye, We hope that we have helped you to get what you want, See you next time.\nBy\nMakarios Nassef\nNathan Eid' --no-wrap
            break
            ;;
      *)
            echo -e "\e[41mPlease select a reliable option.\e[0m"
            ;;

      esac
done
