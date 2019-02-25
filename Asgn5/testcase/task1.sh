#!/bin/bash
gcc -o test -fprofile-arcs -ftest-coverage test.c
rm -rf final.txt
while IFS='' read -r line || [[ -n "$line" ]]; do
	# echo $line
    ./test $line >/dev/null 2>&1
done < testcase.txt
gcov -ib test.c > /dev/null
cat test.c.gcov | grep "lcount" >line.txt
# cat test.c.gcov | grep "branch:[0-9]*,taken" | uniq >branch.txt
gcov -b test.c > /dev/null
cat test.c.gcov | grep -B 1 "branch  0" | sed -n 2~3p > branchprob.txt
cat test.c.gcov | grep -B 1 "branch  0" | sed -n 1~3p > branchline.txt
sed -i 's/\s\+/ /g' branchprob.txt
sed -i 's/\s\+/ /g' branchline.txt
cut -d " " -f 4 branchprob.txt > bprob
cut -d " " -f 3 branchline.txt > bline
paste -d "," bline bprob > done.txt
# cat test.c.gcov | grep "branch  0 taken" > branchprob.txt
echo "line execution frequency" > final.txt
cut -d ":" -f 2 line.txt >> final.txt
# cat branch.txt | cut -d ":" -f 2 | cut -d "," -f 1 > line
# cat branchprob.txt | sed 's/  */ /g' | cut -d " " -f 4 | sed 's/  */ /g' > prob
# paste -d "," line prob > done.txt
echo "Branch Bias" >> final.txt
cat done.txt  >> final.txt
sed -i 's/://g' final.txt
rm -rf line.txt branchline.txt branchprob.txt line bprob bline done.txt test.c.gcov test.gcda test.gcno test
