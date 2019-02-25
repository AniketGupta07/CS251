#!bash

if [ $# -eq 2  ]
then
   gcc -o test -fprofile-arcs -ftest-coverage $1

    while IFS="" read -r testcase 
    do
        ./test $testcase
    done <$2
    
    gcov -i test.gcda
    cat test.c.gcov | grep "lcount" | sed 's/lcount://g' > line_exec_freq
    gcov -ib test.c
    cat test.c.gcov | grep -i "branch.*,taken" | uniq | sed 's/branch://g' | cut -f 1 -d ',' > branch_line

    gcov -b test.c
    cat test.c.gcov | sed 's/  */ /g' | grep -i "branch 1" | cut -f 4 -d " " > branch_bias_temp
    paste -d "," branch_line branch_bias_temp > branch_bias 
    #rm -rf line_exec_freq 
fi    
