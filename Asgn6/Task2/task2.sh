#!/bin/bash

gcc -o sum -Wall -pg $1
./$1
echo "Function,Time" > flat
gprof -bp sum gmon.out | sed '1,5d' | sed 's\  *\ \g' | awk '{print $3F,$NF}' >>  flat
