#!/bin/bash

d() {
	local n="$1" opt count i choice
	if [ -z "$1" ]; then
		echo "This is improved cd command"
		return
	fi
	if [ "${n%/*}" = "${n##*/}" ]; then
		count=`ls -d */ | grep ${n##*/} | wc -l`
		opt=`ls -d */ | grep ${n##*/}`
	else
		count=`ls -d ${n%/*}/*/ | grep ${n##*/} | wc -l`
		opt=`ls -d ${n%/*}/*/ | grep ${n##*/}`
	fi

	if [ $count -gt 1 ]; then
		i=1
		for f in $opt; do
			echo "[$i]: $f"
			i=$((i+1))
		done
		read -p "c: " choice
		opt=`echo $opt | tr "/ " "/\n" | head -n $choice | tail -n 1`
		[ -n "$opt" ] && cd $opt
	elif [ $count -eq 1 ]; then
		cd $opt
	else
		echo Error
	fi
}
