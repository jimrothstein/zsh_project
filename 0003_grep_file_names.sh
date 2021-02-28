#!/bin/zsh
# ----------------------------
#	FILE: 	0003_grep_file_names.sh
# 	DIR:	/home/jim/code/grep_project
# ----------------------------
# 	USAGE:	./0003_grep<TAB> '~'
#		PARM  ${1} must be regex surrounded by single quotes
#   PURPOSE:   For given directory (set by dir=), find all file names match 
#								a grep pattern.
#   SEE ALSO:  
# ----------------------------

# get number of params 
n=${#}
echo $n

# check params
if [ $n -lt 1 ]
then exit 0
fi


#exit 99
#
# assign  location for mp3 files (temp only)
dir=~/Downloads/mp3/practice_area_dup/

# ----------------------
# Uncomment to use dir
# look for twiddle 
#
#print -l ${dir}* | grep -Ei ${1} 
# ----------------------
#
#
# ----------------------
# Uncomment to use current dir
print -l * | grep -Ei ${1} 
# ----------------------
