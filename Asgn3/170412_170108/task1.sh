#!/bin/bash
let  count=0;
while read line ; do
	name="$(echo $line | cut -d ' ' -f 1 )";
	echo $line | cut -d ' ' -f 2 > pem;
	path="$(echo $line | cut -d ' ' -f 3)";
	file "$name" > ftype;
	lib=$(grep -ci "archive" ftype);
	pdf=$(grep -ci "pdf" ftype);
	header=$(grep -ci "source" ftype);
	execute=$(grep -ci "executeable" ftype);
	# mkdir "$path";
	if [[ $lib -gt 0 ]]; then
		path+="lib/";
	elif [[ $pdf -gt 0 ]]; then
		path+="doc/";
	elif [[ $header -gt 0 ]]; then
		path+="include/";
	else
		path+="bin/";
	fi
	mkdir -p "$path";
	
	read=$(grep -ci "Read" pem);
	write=$(grep -ci "Write" pem);
	execute=$(grep -ci "Execute" pem);
	perm="";
	if [[ $read -gt 0 ]]; then
		perm+="r";
	fi
	if [[ $write -gt 0 ]]; then
		perm+="w";
	fi
	if [[ $execute -gt 0 ]]; then
		perm+="x";
	fi		
	mv "$name" "$path";
	chmod u="$perm" "$path$name";
	rm -rf ftype pem;
done < test

