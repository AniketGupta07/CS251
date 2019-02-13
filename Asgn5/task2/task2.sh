#!/bin/bash
gcc -o sum -Wall -pg sum.c 
./sum
gprof -bp sum gmon.out | sed '1,5d' | sed 's\  *\ \g' | awk '{print $3F,$NF}' >  flat
rm -rf final
declare -A arr

while read c1 c2 leftovers;do
	arr[$c2]=$c1;
done < flat   

gprof -bP sum gmon.out | sed '1,7d' > callgraph
let count=0;
while [[ true ]]; do
	cat callgraph | sed '/---/q' > temp;
	NUMOFLINES=$(wc -l < "temp");
	if cmp -s "temp" "callgraph" ; then
   		break;
   	fi
	 sed -i "1,${NUMOFLINES}d" callgraph;
	 let count++;
	sed -ni '/\['"${count}"'\]/,$p' temp;
	 sed -i '$ d' temp;
	 awk '{print $(NF-1)}' temp > func;
	 main=$(head -n 1 func)
	 sed -i '1d' func;
	 if [[ ! -v arr[$main] ]] ; then
 		 let arr[$main]=0
	fi
	 while [[ true ]]; do
		
	    if [ ! -s "func" ] ; then
	    	break;
	    fi
	    
	    sub=$(head -n 1 func);
	     sed -i '1d' func;
	     if [[ ! -v arr[$sub] ]] ; then
 		 	let arr[$sub]=0
	fi
	     echo $main,${arr[$main]},$sub,${arr[$sub]} >> final ;
	 done
done
rm -rf callgraph flat temp func