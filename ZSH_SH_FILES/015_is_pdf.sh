#!/bin/zsh
# 015_is_pdf
#-----------------

#-----------------
#	PURPOSE:	
#		-	examples:	is file specified by the arg a pdf file?
#		-	uses $(file) command
#		-	also, checks the arg before proceeding
#
#	USAGE:		./015_is_pdf <flie_name>
#
# in Vim try,   :! % %
#-----------------


# -------------
# BEGIN:
#	Check script args
# -------------

#echo "$0"			# name of script
#echo "$1"			# arg, if any


# -------------
#	Define functions
# -------------

has_arg() {
	test -n "$1"			# true, if $1 not empty
}


is_pdf()	{
	echo "$(file $1)"		#	returns file type
}

#--------
#		FINALLY,  run .
#--------

if has_arg "$1"
then
	echo "has arg1" 
	is_pdf "$1"
else
	echo "does NOT have arg1"
fi

