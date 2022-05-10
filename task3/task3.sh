#!/bin/bash

start_line='#!/bin/bash'

give_rights ()
{
	chmod ugo+x $1$2
}

for file in $( ls $1 )
do
	had=$( head -1 $1$file )
	if [ "$had" = "$start_line" ]
	then
		if [ ! -x $1$file ]
		then
			echo Файл со строкой $start_line и без прав на исполнение - $file
			give_rights $1 $file
			echo Права на исполнение текущим пользователем файлу - $file - выданы!
		fi
	fi
done
