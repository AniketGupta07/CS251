#!/bin/bash

gcc -o sum -Wall -pg $1
./sum
echo "Function,Time" > flat
gprof -bp sum gmon.out | sed '1,5d' | sed 's\  *\ \g' | awk '{print $NF"," $3F}' >>  flat
