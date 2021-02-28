#!/bin/zsh
# ----------------------------
#	FILE:	032_find_for_PE_sed_name_change.sh
# 	DIR:	/home/jim/code/bash_project
# ----------------------------
# 	USAGE:	./032... 1
#   PURPOSE:  	find for PE change names ... {} \;
#   SEE ALSO:  woolridge: https://mywiki.wooledge.org/BashFAQ/073
# ----------------------------
#
# inbound (source) directory
#
in_dir=$HOME/Downloads/mp3/from_youtube
songs=($HOME/Downloads/mp3/from_youtube/*)	#	Array
pre=1

#-----------------
#		FUNCTIONS
#-----------------
#	NOTE:
# 	1) use PE: remove path 
# 	('return' gives exit code, use echo.)
# 		
# 	2) to remove ./ and begining number
#	find . -type f | sed -E 's/\.\///' | sed -E 's/^[0-9]{4,6}//' 
#
	get_name(){
		x=$1
		# next is tricky:  "${x}" is a string, subject to PE
		echo ${"${x}"##*/}
	}

	remove_number() {
		file=$(get_name $1)	# file is string, no path
		echo "$(echo $file   | sed -E  's/^[0-9]{1,6}//') "
	}

	get_in_dir() {
		echo "${in_dir}"
	}
# --------------------
case "$1" in
	0)
		for s in ~/Downloads/mp3/from_youtube/*
		do
			# all these lines work
			#echo "${s}"    	# includes path
			echo "${s##*/}" # remove path
			#echo "${s##*/}" | sed -E 's/^[0-9]{4,6}//'
		done
		;;
	1)	
		#	Remove path, number; 
		for s in ~/Downloads/mp3/from_youtube/*
		do
			# show proposed name before & after
			echo "${s##*/}" "\n -> " \
				"$(echo ${s##*/} | sed -E 's/^[0-9]{1,6}//') "
		done
		;;
	1.5)
		#	in dir Junk, touch file (0 bytes) with path & number removed 
		mkdir -p junk
		for s in ~/Downloads/mp3/from_youtube/*
		do
			touch "./junk/""$(echo ${s##*/} | sed -E 's/^[0-9]{1,6}//') "
		done

			#new="${old}" 
			#great="${pre}-${x}"
			#mv "${s}" ${great}	
			#((pre++))
			#echo "${new}" | sed -E 's/\.\///' | sed -E 's/^[0-9]{4,6}//'
		;;
	2)	
#	use Array, list , including full path
		for f in "${songs[@]}"
		do
			echo "${f}"
		done
		echo "2" 
		;;
	3)	
#	use Array & function
		for f in "${songs[@]}"
		do
			echo "$(get_name $f)"  #without path
			echo "$(get_in_dir)""$(remove_number $f)" #without path, without number
		done
		echo "3"
		;;
	4)
	#	Two ways to add number, best:  use printf
		pre=1
		for f in "${songs[@]}"
		do
			echo "${pre}""$(remove_number $f)" >> 4_with_number.txt
			echo "$(printf "%05d\n" "${pre}")""$(remove_number $f)" >> 5_with_number.txt
			((pre++))
		done
		;;
	5)
		rm -f 5_with_number.txt
		mkdir -p junk
		pre=1
		for f in "${songs[@]}"
		do
			prefix="$(printf "%05d\n" "${pre}")"
			echo "${prefix}""$(remove_number $f)" >> 5_with_number.txt
			cp "${f}" "junk/""${prefix}""$(remove_number $f)"  
			((pre++))
		done
		;;	

	6)
		find ~/Downloads/mp3/from_youtube -name "*.ogg"
		;;
	*)	
		echo "Usage: $0 {1|2|3..}"


esac

#-----------------
#	WORK ON: array version of PE
#-----------------
# 		dir=~/Downloads/mp3/from_youtube/
# 		myArray=$(find ${dir} -type f)
		#c="${songs[@]##*/}" 
		#d=${songs[@]##*/}
		#echo "$d"	
		#echo "${b[@]##*/}"
		#echo "${c[@]}"
		#
