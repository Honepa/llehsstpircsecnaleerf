#!/bin/bash

chek_key ()
{
	count_lines=$( wc -l $1 | awk '{print $1}' )
    for (( i=1; i <= $count_lines; i++ ))
		do
			now_name=$(cat $1 | head -n$i | tail -n1 | awk '{print $1}')
			if [ "$now_name" = "$2" ]
			then
				echo $(cat $1 | head -n$i | tail -n1 | awk '{print $3}')
			fi
		done
}

while [[ $# > 0 ]]
do
	case "$1" in

                -f|--file_name)
                        file_name="$2"
                        shift
                        ;;

                -k|--key_name)
                        key_name="$2"
                        shift
                        ;;
    esac
    shift
done

if [ $file_name > 1 ]
then
	if [ $key_name > 1 ]
	then
		chek_key $file_name $key_name
	else
		read -p "Введите имя ключа - " key_name
		chek_key $file_name $key_name
	fi
elif [ $key_name > 1 ]
	then
	read -p "Введите имя файла - " file_name
	chek_key $file_name $key_name
else
	read -p "Введите имя файла - " file_name
	read -p "Введите имя ключа - " key_name
	chek_key $file_name $key_name
fi

