#!/bin/zsh
#
#
# ~/code/MASTER_INDEX.md
# [~/code/zsh_scripts_project]
#
#	021_bash_experiments.sh
# TAGS:  zsh, scripts,case,function, find, script error,
# file <- "021_bash_experiments.sh#"

#------ nvim: run inline -----
#	:!./021<TAB>			# works!
#-----------------------
#
#	--------------------
#		FUNCTIONS
#	--------------------
	function list_files () 
		find "$1" -name "*.ogg" -o -name "*.mp3" | sort -d | while read f; do
			echo "${f##*/}"
		done

case $1 in
# ================
  # Help message
  -h)
    echo "help"
    ;;
# ================
	1)
	####	generate error ####
	#rm no_such_file || { echo  'oops' >&2; exit 1;}

	# ---- cleanly handles error -------
	rm no_such_file 2>junk || echo 'oops'
	;;
	2)
	#	--------------------
	#		prompt user for input
	#	--------------------
	# fails
	#read -p  "Enter:   " value
	#echo "value is  ${value}"
	;;
	3)
		echo "simplest PE - see 039_ "		
		;;
	4)

		#	--------------------
		#	 declare
		#	--------------------

		#	SEE 037_declare.sh or 040_declare2_output.md
		#
		;;
	5)
		#	upper case
		x="jim"
		echo "${x}"
		#echo "${x^}"			# this is bash, not zsh
		echo "${x:u}"			# "JIM"
		;;
	6)
		find ~/Downloads/mp3 -name "*.ogg" -o -name "*.mp3" | wc -l
		find ~/Downloads/mp3 -name "*.ogg" -o -name "*.mp3" | while read f; do
		echo "${f##*/}"
	done
		;;
	7)

		list_files ~/Downloads/mp3/    # do NOT quote, will break
		;;
	8)	# replace with PARALLEL

		prefix="pre-"
		function list_files1 () 
		find "$1" -name "*.ogg" -o -name "*.mp3" | sort -d | while read f; do
			echo "${prefix}${f##*/}" 
			done
		list_files1 ~/Downloads/mp3/
		;;	
	81)
		echo "running in dir = " $PWD


esac
