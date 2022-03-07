#!/bin/zsh
# ----------------------------
#	FILE:	059_process_substitution.sh
# 	DIR:	/home/jim/code/bash_project
# ----------------------------
# 	USAGE:	
#   PURPOSE:  	
#   SEE ALSO: zsh_guide 3.6.3 
# ----------------------------
case $1 in
	10)
		#	PROCESS SUBSTITUTION
		# not sure understand the reason for 2 <
		# point is creates a temporary file, deleted when done
		#
		cat < <(echo This is output)
		;;
	20)
		#	PROCESS SUBSTITUTION
		# not sure understand the reason for 2 <
		# point is creates a temporary file, deleted when done
		#
		echo Hello > >(sed 's/Hello/Bye/' > outfile)
		;;
	30)
		echo Hello > >(sed 's/Hello/Bye/' > outfile)
		;;
	*)
esac
