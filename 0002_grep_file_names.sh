#!/bin/zsh
# ----------------------------
#	FILE: 	0002_grep_file_names.sh
# 	DIR:	/home/jim/code/grep_project
# ----------------------------
# 	USAGE:	./0002_grep<TAB>
#   PURPOSE:   For given directory (set by dir=), find all file names match 
#								a grep pattern.
#   SEE ALSO:  
# ----------------------------

# a location for mp3 files (temp only)
dir=~/Downloads/mp3/practice_area_dup/

# look for twiddle 
print -l ${dir}* | grep -Ei '~' 
