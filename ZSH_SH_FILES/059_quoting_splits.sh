#!/bin/zsh
# ----------------------------
#	FILE:	032_find_for_PE_sed_name_change.sh
# 	DIR:	/home/jim/code/bash_project
# ----------------------------

# 	USAGE:	./032... 1
#   PURPOSE:  	find for PE change names ... {} \;
#   SEE ALSO:  woolridge: https://mywiki.wooledge.org/BashFAQ/073
# ----------------------------
#_
# -----------------------
# 	Ref:Zsh Guide 2.4
# -----------------------
# -------------------
case $1 in
10)
#	no quotes (if unambiguous)
foo=oneword
#	READ '$' as expand or informal, substition
print -- $foo
print -- '$foo is "'  $foo  '"'		# study,  string-expand-string
;;
20)
#	2.4.1:   One string, unlike Bash
foo='This is one string'
print -- $foo		# prints above, sans single quotes
ls $foo				# fails, note:  sees as 1 argument, not 4

# BUT ... also behaves like array of single char
print -- ${#foo}
print -- $foo[1]
	;;
30)
# Check SH_WORD_SPLIT is OFF
# WHY FAIL?
set -o | grep -e shsplitword

foo='*'		# single quote
print $foo	# *,  no expansion with single quotes
;;
*) 
	esac


