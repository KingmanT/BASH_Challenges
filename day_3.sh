#!/bin/bash

# Create a BASH Script that will take a number from the users input 
# and output the following pattern:
# 
# 1
# 2 3
# 4 5 6
# 7 8 9 10

# seq -s " " 1 1
# seq -s " " 2 3
# seq -s " " 4 6
# seq -s " " 7 10

s=1
e=1
count=1
read -p "enter a number" n

while [[ $e -le $n ]]; do 
seq -s " " $s $e
s=$(($e + 1))
e=$(($s + $count))
count=$((count + 1))
done