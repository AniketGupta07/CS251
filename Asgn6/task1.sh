#!/bin/bash

let count=0

if [ $# -eq 2  ]
then
    gcc -o test -fprofile-arcs -ftest-coverage $1 3> /dev/null
    while IFS="" read -r testcase 
    do
    	let count=count+1
        ./test $testcase > /dev/null
        gcov -i test.gcda > /dev/null
 	    echo "line_number,execution_count" > line_exec_freq
 	    cat test.c.gcov | grep "lcount" | sed 's/lcount://g' >> line_exec_freq
 	    gcov -b test.c  > /dev/null
 	    echo "line_number,bias" > branch_bias
 	    cat test.c.gcov | grep -i -B 1 "branch  0" | sed 's/  */ /g' | sed 's/^ [0-9]*: //g' | sed 's/://g' > temp
    	grep -Eo "^[0-9]*" temp > branches
    	grep -E "branch" temp | cut -f 4 -d " " > bias 
    	echo "branch_line,bias" > "branch_bias$count"
    	paste -d "," branches bias >> "branch_bias$count"
    	rm -rf branches temp bias test.gcda test.c.gcov 
    
    done <$2
	   	
fi    
