#!/bin/zsh
#############
#	test_zsh
############
# 023_test_zsh
#
# /home/jim/code/bash_project
# SEE:	zshguide 
# TAGS:  if-then, login, VIMODE,  zle -N zle-keymap-select, zsh.trace
############
#	RUN:	zsh ~/bin/023_test_zsh.sh
############

#   USAGE:    ./23_test_zsh 20
#   echo $?    last line executed; 0=success, 1=fail

case $1 in
	10)
if [[ -o login ]]
	then	print -- 'login'
	else	print -- 'not login'
fi

if [[ -o login ]]; then print -- 'login'; else print -- 'not login'; fi

# feeling lazy; same info... 0=success 1=fail
[[ -o login ]]; echo $?
	;;
	20)
#	interactive shell?
if [[ -o interactive ]]
	then	print -- 'interactive'
	else	print -- 'not interactive'
fi
;;
	30)
#	STUDY
foo='JIM'					# simplest, no expansion
print -- '$foo is "'$foo'"'	# 3 parts!    $foo is JIM
;;
	40)
#	fct
fn()	{print -- "Name of this function is $0";}
fn
;;
	50)
#	array
foo=('one' 'two' '3' 'four')		# play safe, use single quotes
print -- ${foo[2]}					# element of array
;;
	60)
#	GLOB
ls *.(txt|md|sh)							# OR
;;

	70)
# ##################
# 	mode?
# ##################
# set VIMODE according to the current mode (default “[i]”)
VIMODE='[i]'
function zle-keymap-select {
 VIMODE="${${KEYMAP/vicmd/[n]}/(main|viins)/[i]}"
 zle reset-prompt
}
zle -N zle-keymap-select
;;
	80)
# #################
# 	set PS1
# #################
# Set the prompt to “[user]@[host[ [vi mode] $ ”
#PROMPT="%n@%m ${VIMODE} \\$ "


# ################
# 	startup zsh scripts - where is param set?
# ################
# This saves to file:  zsh.trace
zsh -x 2>zsh.trace	# saves startup
exit
grep alias zsh.trace
;;

	*)	echo "usage:   !zsh %  1|2 ..."
esac

