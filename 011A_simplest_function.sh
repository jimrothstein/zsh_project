#!/bin/zsh

my_name(){
	# 'return'  gives exit code; not what I want here.
	echo "jim"
}


my_name2(){
	echo "$1"
  echo ${1}
}
my_name

my_name2 "joe"
exit
