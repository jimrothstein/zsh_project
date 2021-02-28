#!/bin/zsh

#### 008_arrays.sh####
case $1 in
	10)
i=5+3
echo $i			# 5+3
echo "$i"		# 5+3
echo $[i]		# 8
echo "$[i]"		# 8
echo "${i}"		# 5 + 3

declare -i kk
kk=5+3			# 8
echo $kk

exit
;;
20)
dotfiles=("a" "b" "c")
for j in "${dotfiles[@]}"
do
	echo "${j}" 

done
exit
;;
30)
for i in * # each file
do
	echo ${i} 
#	mv "$i" "$pre_$i"
#	((pre++))
#	do


## next line creates new file!
  #mv "$i" "${i/.sh/_ex.sh}"
  echo ${i} 
done
  ;;

  40) 
	  a=(1 2 3)
	  print ${(k)a}
	  ;;
50)		# prints NOTHING
	  # Colors!
	  print ${(k)fg}
	  ;;
51)
	a=$(ls *)	# seems to create array of 1 char, not words
	print ${#a}
	print ${a[1]}
	;;
52)
#	a=(one two three)
	set one two three

	first_match_from left() {
	x="${1}"
	print ${#x}					# 4 ??
	print ${x[(r)t*]}			# s/d two, but only "t", why?
}

	first_match_from left $* #   "${a}"
	print $a[(R)t*]			# three
	;;	
53)
	# return index, first match from left
	#a=(one two three)
	set one two three

	#print ${#a}
	#print ${a[(i)t*]}
	index_of_first_match_from_left(){
		x="${1}"	
		print ${x[(i)t*]} 		# 5???
	}
	#index_of_first_match_from_left "${a[@]}"
	index_of_first_match_from_left "$@" 

	;;
60)
	# DEFAULT,   unlike bash, zsh does not use whitespace to separate params
	args()	{
		print $# $* }
	set one two three four
	args $*
	args $@
	echo " "
	args "$*"			# 1 long string
	args "$@"			# 4 strings (as though unquoted)

	;;
61)
	# Works: don't understand
	function i_want_array () {
    local array_name=$1
	# P tells zsh to treat as parameter??
    echo "first array element is: " ${(P)${array_name}[1]}
}
	a=(one two three)  # array a
	i_want_array "a"	# no $??
	b=("one two" three)
	i_want_array "b"
	;;
70)
	# use typset, set is from older shells
	append_to_array(){
		# how to do??
	}

	typeset -a X
	X=("A" "B" "C")
	print $X
	Y=(A B C)
	print $Y
	X=("${X[@]}" "D")	# works! A B C D
	print $X
	;;
	*)
		;;
	  esac

