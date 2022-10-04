#!/bin/bash

# Read an multi-digit number from user and reverse the number.
# Its not just printing in reverse order
# You have to extract each digit and convert to reverse.
# When ‘0’ comes as last digit, discard while reversing.

#Set $num as user input
num=$@

# Create while loop for number.  Each time loop runs, number is divided by 10 and the remainder saved as $mun.  
# REMAINDER OF ANY NUMBER WILL ALWAYS BE THE NUMBER IN THE 1's PLACE! (% to get remainder)
# number is updated by dividing number by 10 which essentially removes the digit in the 1's place.
# reverse number is the concatenation of each of the remainders


while ((num>0)); do
    mun=$mun$((num%10))
    num=$(($num/10))
done
echo $mun

