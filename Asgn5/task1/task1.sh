#!/bin/bash
gcc -o test -fprofile-arcs -ftest-coverage test.c
./test > /dev/null
gcov -ib test.c > /dev/null
cat test.c.gcov | grep "lcount" >line.txt
cat test.c.gcov | grep "branch:[0-9]*,taken" | uniq >branch.txt
gcov -b test.c > /dev/null
cat test.c.gcov | grep "branch  0 taken" > branchprob.txt
echo "line execution frequency" > final.txt
cut -d ":" -f 2 line.txt >> final.txt
cat branch.txt | cut -d ":" -f 2 | cut -d "," -f 1 > line
cat branchprob.txt | sed 's/  */ /g' | cut -d " " -f 4 | sed 's/  */ /g' > prob
paste -d "," line prob > done.txt
echo "Branch Bias" >> final.txt
cat done.txt  >> final.txt
rm -rf line.txt branch.txt branchprob.txt line prob done.txt test.c.gcov test.gcda test.gcno test
