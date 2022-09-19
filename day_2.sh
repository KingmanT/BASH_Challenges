#!/bin/bash

# Create a BASH Script that will take a number from user input
# and output the following pattern:
# 1
# 12
# 123
# 1234

read -p "enter a number" n
count=1
while [[ $count -le $n ]]; do
    seq -s " " $count 
    count=$((count + 1))
done