#!/bin/bash

# Using command-line pass n arguments.
# Compare all these arguments and print the largest value
# Print error in-case no arguments.
# Number of arguments can vary every time.

# Check to see if there is at least one argument
if [[ -z $1 ]]; then 
    echo "This script requires at least one integer argument"
    exit 1
fi

# Set all arguements as an array in $num
num=($@)

## SOLUTION 1 ##

# Set Internal Field Separator as new space, sort in reverse, print first line
IFS=$'\n'
echo "The largest argument is:"
echo "${num[*]}" | sort -nr | head -n 1
unset IFS

## SOLUTION 2 ##

# For every number in $num array, compare to $max. ONLY IF i is greater than max, set max to $i then move to next number
for i in "${num[@]}"; do
    (( i > max )) && max=$i
done
echo "The largest argument is:"
echo $max