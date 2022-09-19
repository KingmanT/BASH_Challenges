#!/bin/bash

read -p "enter a number" n
count=1
while [[ $count -le $n ]]; do
    seq -s " " $count 
    count=$((count + 1))
done