#!/bin/bash

# User must provide two numbers and operator through command-line
# Based on input do the operation and show the output.
# Use case to handle multiple operations

read -p "Please enter your first number: " num1
read -p "Please enter your second number: " num2
echo "From the following list:"
PS3="What type of arithmatic would you like to perform on those two numbers?"
options=("addition" "subtraction" "multiplication" "division")
select ans in "${options[@]}";
do
    case $ans in
        addition)
            num3=`echo $num1+$num2 | bc -l`
            echo "$num1 + $num2 = $num3"
            break
        ;;
        subtraction)
            num3=`echo $num1-$num2 | bc -l`
            echo "$num1 - $num2 = $num3"
            break
        ;;
        multiplication)
            num3=`echo $num1*$num2 | bc -l`
            echo "$num1 x $num2 = $num3"
            break
        ;;
        division)
            num3=`echo $num1/$num2 | bc -l`
            echo "$num1 / $num2 = $num3"
            break
        ;;
        *)
            echo "$REPLY is not a valid option from the list"
    esac
done