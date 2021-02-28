#!/bin/bash

# defaults, see ~./vimrc

# Comment
echo "Hello World"

# no spaces:
myName="jim"

# constant
declare -r NUM1=5

# a variable
num2=4

# add
num3=$((NUM1+num2))
num4=$((NUM1-num2))
num5=$((NUM1*num2))
num6=$((NUM1/num2))

echo "5 + 4 = $num3"
echo "5 - 4 = $num4"
echo "5 * 4 = $num5"
echo "5 / 4 = $num6"
