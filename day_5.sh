#!/bin/bash

# Ask user to enter two numbers
# User can enter real numbers also
# Use bc command and piping to do.

read -p "Enter a number: " num1
read -p "Enter a number you would like to add to $num1: " num2
num3=`echo "$num1+$num2" | bc`

echo "$num1 + $num2 = $num3"