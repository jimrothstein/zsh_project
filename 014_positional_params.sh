#!/bin/zsh

#	014_positional_params.sh

# :r !pwd:   /home/jim/code/bash_project
#	
# Wed Jan 16 19:20:59 PST 2019
#	:r !date (to insert date)
#
#############################
#	positional parameters
#
#############################
echo "first position param = ${1}"					# works
echo "second p param = ${2}"					# works
echo "program name = ${0}"						# works

#  ./   a b
s='${@}'
echo "${s}=${@}"					# a b (all params)

# IFS expansion of positional parmas
s='${*}'
echo "${s}=${*}" 				# a b  

# number of positional parms
s='${#}'
echo "${s}=${#}"					# 2

# current set options in shell
echo "set options = ${-}"	# hB					

# pid of current shell (not subshell?)
echo "pid = ${$}"			# 21862

# abs path of command to ...
echo "command = ${_}"

# 'IFS' input field separator
echo "IFS = ${IFS}"

# recent foreground pipeline exit status
echo "prior exit = ${?}"

# PID of most recent background cmd
echo "PID of last back cmd = ${!}"

#############################
#	array
#
##############################
names=("jim","joe")						# note ,

for name in "${names[@]}" 				# jim,joe
do
	echo "${name}"
done
# subtle difference!					# white space
										# jim
names=("jim" "joe")						# joe	
for name in "${names[@]}" 				
do
	echo "${name}"
	
done
###############################
# ---------------
# parameter expansion - example
# ${VAR/search/replace}
# VAR=aabbcc
# echo ${VAR/b/-dd-}	# aa-dd-bcc  (depends greedy or not)
# ---------------
#
# -------------
#  initialize variables
#  ------------
x=${1}
if test ${x:-0} -eq 0		# check if already set
then	
	echo "x was not set, now set to default=0"
else
	echo "x was set="${x}
fi

# same, except looking for env y
# TRICK:
#> env y=2 zsh 014_positional...... 
if test ${y:-0} -eq 0		# check if already set
then	
	echo "env y was not set, now set to default=0"
else
	echo "y was set="${y}
fi
