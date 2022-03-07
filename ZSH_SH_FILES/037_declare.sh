#!/bin/zsh
# ----------------------------
#	FILE:	037_declare.sh	
# 	DIR:	/home/jim/code/bash_project
# ----------------------------
# 	USAGE:	!zsh % 1 [%]
#   PURPOSE:  	declare - examples
#	SEE:	https://stackoverflow.com/questions/19742062/why-are-declare-f-and-declare-a-needed-in-bash-scripts

# ----------------------------
#		DECLARE (examples)
#		DECLARE (in zsh) does NOT support -ir, -ia etc
#		setting string to int results in value 0.
#
#		- declare -p VAR   # to see what shell things
#	--------------------
case $1 in
	1)
		declare -ir x=$2  		#int and readonly
		declare -p x
		# if x NOT assigned an integer, ${x} will be 0
		#  (A && B) || C
		test "${x}" -eq $2	&& echo "yes" || echo "no"
		echo "survived"

		# do NOT want to see error msg?
		test "${x}" -eq $2 2>/dev/null	&& echo "yes" || echo "no"
		echo "survived -- error msg redirected"
		;;
	2)
		# Declare an array of integers (no such thing in zsh)
	declare -ai int_array	# no such thing
	declare -p int_array	# typeset -i int_array=0
	int_array=(1 2 3)
	declare -p int_array	# now:   typeset -a int_array=(1,2,3)
	echo "${int_array[@]}"

	# Setting a string as array value fails (in BASH, not zsh)
	# (and script stops)
	int_array[1]="Should fail" || echo "2:error: ${LINENO}"
	echo "${int_array[@]}"
	echo "2:survived"
	;;
2.1)
	# Declare an int
	declare -i i_var=3
	echo "${i_var}"
	
	# (bash, zsh) next line:   error AND exits
	i_var="a string" || echo "error: ${LINENO}"
	echo "survived"
	;;

	3)

	# Convert array values to lower case (or upper case with -u)
		declare -al lowercase_array

		lowercase_array[1]="I AM A STRING"
		lowercase_array[2]="ANOTHER STRING"

		echo "${lowercase_array[1]:l}"
		echo "${lowercase_array[2]}"
	;;
	4)

		test -f "$2" || echo "not a file"
		test -x "$2" || echo "does not exist"
	;;

	5)
		test $# -eq 2 || exit 1
		test -f "$2"  || exit 2
		wc -l "$2"
		;;
	6)
		unknown_var=1
		unset unknown_var		# as if never defined
		test -v unknown_var || echo "not set"


		;;
		
esac
exit
# Make a read only array
declare -ar readonly_array=(42 "A String")

# Setting a new value fails
readonly_array[0]=23

# -----------------------
# 	NOTES
# -----------------------
#
#

Using zsh typeset can produce a few possible outcomes:
-	no errors, works (yeah!).
-	errors, script fails (fix!).
-	no errors, but **unexpected** behavior.  (scratch head)


As an example of last category, this produces no errors, but the `typeset -p` reveals -i is
ignored
```
{
unset int_array
typeset -ia int_array
int_array=(1 2 3)
echo $? "-Point A"
typeset -p int_array

	} always {

echo $? "-Point B"
typeset -p int_array  
(( TRY_BLOCK_ERROR=0 ))
}
echo $? "-Point C"
echo "survived"
```
produces
```
0 -Point A
typeset -a int_array=( 1 2 3 )
0 -Point B
typeset -a int_array=( 1 2 3 )
0 -Point C
survived
```
The first line unsets int_array.   The typeset command declares
int_array to be both an array and int, which is not what zsh allows.  The next
line assigns int_array to a value.   There is no error as the `$?` tells us,
but close examination of final `typeset  -p int_array` reveals what actually
happened.

With a small change, we can produce errors and use the `always` block and
`typeset -p` to find more details.
```
{
unset int_array
typeset -ia int_array=(1 2 3) # error
echo $? "-Point A"
typeset -p int_array 

	} always {

echo $? "-Point B"
typeset -p int_array
(( TRY_BLOCK_ERROR=0 ))
}
echo $? "-Point C"
echo "survived"
```
```
040_declare_version2.sh:typeset:135: int_array: inconsistent type for assignment
1 -Point B
040_declare_version2.sh:typeset:140: no such variable: int_array
1 -Point C
survived
```
The only difference is int_array was given a value in the faulty `typeset -ia` statement.
This produces errors, and the scripts jumps to the `always block.`
The `(( TRY_BLOCK_ERROR=0))` allows the script to continue
and not terminate, but the error is still reported at "Point C".


To check shell version:
```
$SHELL --version
zsh 5.4.2 (x86_64-ubuntu-linux-gnu)
```
