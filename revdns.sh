#!/bin/bash

if [[ $1 == "" || $2 == "" || $3 == "" ]];then
	echo -e "
$0 \033[0;31mIP Range_init Range_end --filter \033[1;37m'url'

\033[0;31mex\033[1;37m : $0 23.16.127 16 231
\033[0;31mex\033[1;37m : 23.16.127 16 231 --filter 'fbi.gov'
";exit

fi

echo -e "
\033[0;31mTrying Reverse DNS Search\033[1;37m
"

if [[ $5 != "" ]];then
	for range in $(seq $2 $3);do
		host -W 1 $1.$range|grep $5
        done
else
	for range in $(seq $2 $3);do
		host -W 1 $1.$range|grep -v "NXDOMAIN"
	done
fi

printf "\n";
