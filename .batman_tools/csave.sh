#!/bin/bash

cs () {
	local path="$HOME/.csr" file="locations"
	mkdir -p "$path"
	echo "$PWD" >> "$path/$file"
	tail -10 "$path/$file" > "$path/${file}.bkp"
	mv "$path/${file}.bkp" "$path/$file"
}

cr () {
	local path="$HOME/.csr" file="locations" i="$1" f

	[ -z "$1" ] && i=1

	f=`tail -$i "$path/$file" | head -1`
	echo "$f"
	cd "$f"
}

ch () {
	local i f oldifs
	i=`cat $HOME/.csr/locations | wc -l`
	oldifs=$IFS
	IFS='
'
	for f in `cat $HOME/.csr/locations`; do
		echo "[$i] $f [$i]";
		i=$((i-1));
	done
	IFS=$oldifs

}
