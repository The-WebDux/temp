#!/usr/bin/bash
# Coded by WebDux

a=$(echo "|-------[ TEMP ]------")
b=$(sensors | grep 'CPU:\|fan1:')
c=$(echo " |---------------------")

for intro in $b
do
	myarray+=($intro)
done

tempcels=${myarray[4]}
strtemp="${tempcels//[!0-9]/}"
limit=65

if [[ $strtemp < $limit ]]
	then
		echo -e "\e[33m" $a '\e[0m'
		echo "  FAN:" ${myarray[1]} ${myarray[2]}
    	echo -e "" "\033[34m" ${myarray[3]} ${myarray[4]}
    	echo -e "\e[33m" $c
	else if [[ $strtemp > $limit ]]
    	then
		echo -e "\e[33m" $a '\e[0m'
		echo "  FAN:" ${myarray[1]} ${myarray[2]}
    	echo -e "" "\033[31m" ${myarray[3]} ${myarray[4]}
    	echo -e "\e[33m" $c
	fi
fi
