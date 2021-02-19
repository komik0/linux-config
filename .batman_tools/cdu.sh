#!/bin/bash

c () {
	if [[ -z "$1" ]]
	then
		cd ..
		return
	fi
	path=`dirs -l`
	file=`echo $path | tr '/' '\n' | grep ^$1 | head -1`
	if [ "$path" = "${path%$file/*}" ]
	then
		o=$path
	else
		o=${path%$file/*}$file
	fi
	echo $o
	cd $o
}
