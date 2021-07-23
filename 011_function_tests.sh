#!/bin/zsh
# 011_function_tests.sh
# see http://www.faqs.org/docs/abs/HTML/comparison-ops.html
#-----------------
# is env var set?
#-----------------

#### functions ####
is_length_zero_v2() { [[ -z "$1" ]]; }			# same
is_length_zero() { test -z "$1"; }			# true if 0, null, not set
is_equal_string() { [[ "$1" == "$2" ]];}


print_length()	{
	if is_length_zero_v2 "$1" 
then
	echo "length=0"
else
	echo "length!=0"
fi
}



###################

print_length "$STATE"					# =0

STATE="OR"
print_length "$STATE" 					# !=0

STATE=
print_length "$STATE"					# =0

STATE=NULL						# !=0
print_length "$STATE"

STATE="MA"

is_equal_string "MA" "MA"
exit
if [[ "MA" == "MA" ]]					# string compare
then
	echo "same"
else
	echo "not same"
fi
