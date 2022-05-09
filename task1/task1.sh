#!/bin/bash

if [ -n "$1" ]
	then 
	#found max input digit
	max=$1
	for i in $@
		do
			if [ "$i" -gt "$max" ]
				then
				max=$i
				fi
		done
	echo Максимальное введённое число - $max
#found summ 
	summ=0
	for i in $@
		do
			summ=$(( $summ + $i * $i))
		done
	echo Сумма квадратов введёных чисел - $summ
	else
		echo No digits input
fi
