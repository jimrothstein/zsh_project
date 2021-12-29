#!/bin/zsh
# ----------------------------
# 	000_PE_simple_examples.sh 
# 	/home/jim/code/bash_project
# 	Wed Jan 16 20:14:24 PST 2019
# ----------------------------
#   Bash Parameter Expansion (PE)
#   see woolridge: https://mywiki.wooledge.org/BashFAQ/073
# ----------------------------
case "$1" in
1)	
# ------------------------
#	simple PE   ${VAR##}
# ------------------------
param=jimbo
# from left, chop jim
echo	${param#jim}	#bo

param=jimjimbo
echo 	${param#jim}	#jimbo

# from left, greedy (all)
echo 	${param##jim}	#jimbo;  why not jimjim? (longestmatch)
echo 	${param##*jim}	#bo
;;
	2)	
f="~/code/bash_project/000_PE_examples.sh"
# from left, remove all */
echo ${f##*/} 	# 000_PE_examples.sh

echo $(dirname $f)		# ~/code/bash_project
;;
3)
# ------------------------
#	more PE
# ------------------------
# 
f=my.file.txt
echo $f
echo ${f}
echo ${f#*.}  # file.txt everything AFTER first .
echo ${f##*.} # txt everything AFTER last .   (ie ext)
;;
4)
#	more chopping
#
s="line="
echo ${s}${LINENO}	# line number, place safe put in quotes

s="name"
file="data.txt"
echo "${s}=${file%.*}"	# name=data

s="ext"
echo "${s}=${file#*.}"  # ext=txt everything AFTER .
;;
5)
#https://mywiki.wooledge.org/BashGuide/Parameters

file="$HOME/.secrets/007"; \
echo "File location: $file"; \
echo "Filename: ${file##*/}"; \
echo "Directory of file: ${file%/*}"; \
echo "Non-secret file: ${file/secrets/not_secret}"; \
echo; \
echo "Other file location: ${other:-There is no other file}"; \
echo "Using file if there is no other file: ${other:=$file}"; \
echo "Other filename: ${other##*/}"; \
echo "Other file location length: ${#other}"
;;

50)	# USEFUL!
	#  A && B || C    (groups from left)
	source ~/.oh-my-zsh/custom/test.zsh
	say_hi
	[[ 2 -gt 1 ]] && [[ 2 -lt 1 ]] && echo "A && B" || echo "C"
	;;
51)

	echo "These are not set"
	echo ${x-"not set"}
	x
	echo ${x-"not set"}
	x=1
	unset x
	echo ${x-"not set"}
	typeset -i x
	unset x
	echo ${x-"not set"}
	
	echo "These are are set, return the value, which may be empty"
	x=""
	echo ${x-"not set"}
	unset x
	x=
	echo ${x-"not set"}
	unset x
	typeset -i x
	echo ${x-"not set"}
	echo "Problem is in a function"
is_param_set(){
	x=$1
	echo $x
	return=${x-"not set"}
	echo ${return}
	if [[ $return != "not set" ]]
	then
		echo "set"
	else
		echo "not set"
	fi
}
unset y
echo ${y-"not set"}
is_param_set "${y}"
;;
60)
# ------------
# SIMPLEST PE
# ------------
#

is_param_set() {
	echo "${1}"
	if [[ "$1" -eq 0 ]] 
	then 
		echo "not set"
	fi
}
is_param_null(){
		x=${1}
		if [[ "${x:-null}" == "null" ]]
		then
			echo "null"
		fi
}
echo "${+VAR}"	# 0
is_param_set $VAR
is_param_null $VAR
 exit
echo "${VAR-jim}" # jim
echo "${VAR:-jim}"
echo "HOME is ${HOME}"
echo "WORD is ${WORD}"	# blank
echo "WORD is ${WORD-"unset"}"	# unset
WORD=""
echo "WORD is ${WORD-"empty"}"  # blank
#echo "WORD is ${WORD:-:"
declare WORD1
echo "WORD1 is ${WORD1}"	# blank
;;

	*)	echo "Usage: $0 {1|2}"
	
esac
exit

