#!/bin/bash

# User must provide two numbers and operator through command-line
# Based on input do the operation and show the output.
# Use case to handle multiple operations

case $2 in
    "+")
        ans=`echo $1+$3 | bc -l`
        echo "$1 + $3 = $ans"
    ;;
    "-")
        ans=`echo $1-$3 | bc -l`
        echo "$1 - $3 = $ans"
    ;;
    "x")
        ans=`echo $1*$3 | bc -l`
        echo "$1 x $3 = $ans"
    ;;
    "/")
        ans=`echo $1/$3 | bc -l`
        echo "$1 / $3 = $ans"
    ;;
esac