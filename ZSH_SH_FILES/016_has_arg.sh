#!/bin/zsh
# file <- "/home/jim/code/zsh_project/ZSH_SH_FILES/016_has_arg.sh#"
#
#
# PURPOSE:  Test for arg.  If not exit.
# USAGE:		./016_has_arg.sh <arg>
#
#	returns true or false
has_arg() {
	test -n "$1"
}

if has_arg "$1"
then
else  echo "** problem ** "
			echo "USAGE: must have arg"
			exit
fi


