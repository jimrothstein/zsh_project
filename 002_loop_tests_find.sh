#!/bin/bash

# 002_simple_bash_loop


####################
#	test PS1
#
####################
if [ -z $PS1 ] # no prompt?
### if [ -v PS1 ]   # On Bash 4.2+ ...
then
  # non-interactive
    echo "no prompt"  ...
else
  # interactive					# this one
    echo "yes prompt"
fi
exit



###################
#	Fix!  no let
#
###################
# bash script, note test operator [
#
#n=1
##while [ $n -le 6 ]; do
#	echo $n
#	let n++
#  done


#####################
# functions_style.sh
# see https://codereview.stackexchange.com/questions/181855/script-to-create-symlinks-for-dotfiles-in-a-git-repository
#####################

# create function
file_exists() { test -e "$1"; }

# use function
	file_loc="$1"
    symlink_loc="$2"

    if ! file_exists "$file_loc"
    then
	    echo "error ...."
	   exit  99
    #    return invalid_file_error "$file_loc" 
    fi


######################
#	I/O example
#
######################
echo "input"
read input
echo "input = " $input

