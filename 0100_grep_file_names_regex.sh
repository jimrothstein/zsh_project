#!/bin/zsh
# ----------------------------
#	FILE: 	0100_grep_file_names_regex.sh
# 	DIR:	/home/jim/code/grep_project
# ----------------------------


# ---------------------------------------------
#
# USAGE:  ./0100_grep_file_names_regex<TAB> <regex>
# PURPOSE:  For current directory, find all files match <regex> 
#
#
# Example 1:  Files end in  'sh$' 
# ./0100_<TAB> 'sh$'


# Example 2:  Files begin with 0
# ./0100_<TAB> '^0'


print -l * | grep -Ei ${1}

# print -l $1 | grep -Ei 'sh$'

# ---------------  Working Example ----
# dir=~/Downloads/mp3/from_youtube/

# look for  file names with Jjudith and have  Far in title.
# print -l ${dir}* | grep -Ei '[Jj]udith.*Far' 
#
#
# 
# ----------------------
# Uncomment to use current dir
print -l * | grep -Ei ${1} 
# ----------------------
