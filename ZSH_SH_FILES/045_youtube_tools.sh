#!/bin/zsh
# ----------------------------
#	FILE:	045_youtube_tools.sh
# 	DIR:	/home/jim/code/bash_project
# ----------------------------
# 	USAGE:	
#   PURPOSE:  tools to rename, renumber youtube download mp3	
#   SEE ALSO:  
# ----------------------------

#	TO RUN
#	zsh 045_youtube_tools.sh 23 (silent, removes OLD number)
#	zsh 045_youtube_tools.sh 70 (silent, prepends NEW number)	
#	
#
#	20 makes NO changes, proposes new name (without number)
#	22 dry run - remove old number (no actual changes)	
#	23 removes old number
#	70 renumbers
# inbound (source) directory
# TAGS:  zsh, case, ls
#
the_dir=$HOME/Downloads/mp3/from_youtube
songs=($HOME/Downloads/mp3/from_youtube/*)	#	Array

case "$1" in
	10)	# check cd, PWD - works
		cd ~/Downloads/mp3/from_youtube
		echo $PWD
		cd -
		echo $PWD	# back here, works
		;;
	11)
		check_directories(){
		cd ~/Downloads/mp3/from_youtube
		echo $PWD
		cd -
		echo $PWD	# back here, works
	}
		check_directories
		;;

	12)	# BEST
		check_directories_v2(){
		pushd ~/Downloads/mp3/from_youtube
		echo $PWD
		popd		
		echo $PWD	# back here, works
	}
		check_directories_v2
		;;
	20)	#	strip numbers:   proposed	- Works
		#	Remove path, number; 
		for s in ~/Downloads/mp3/from_youtube/*
		do
			# show proposed name before & after
			echo "${s##*/}" "\n -> " \
				"$(echo ${s##*/} | sed -E 's/^[0-9]{1,6}//') "
		done
		;;
	21)
		#  	Same as #20, but run from actual directory - works
		cd ~/Downloads/mp3/from_youtube
		#	Remove path, number; 
		for s in ~/Downloads/mp3/from_youtube/*
		do
			# show proposed name before & after
			echo "${s##*/}" "\n -> " \
				"$(echo ${s##*/} | sed -E 's/^[0-9]{1,6}//') "
		done
		cd -	# return to here
		;;
	22)
		#  Makes NO changes, just lists old, proposed new file names 
		#  	Run from actual directory
		cd ~/Downloads/mp3/from_youtube
		#	Remove path, number; 
		for s in ~/Downloads/mp3/from_youtube/*
		do
			# show proposed name before & after
			# actually, no need to strip off directory
			oldname="$(echo "${s##*/}")"	
			newname="$(echo ${s##*/} | sed -E 's/^[0-9]{1,6}//') "
			echo "${oldname}" "\n >>> " "${newname}"
		done
		cd -	# return to here
		;;
	23)	#	WORKING CODE: does what 22 proposes, no output
		#	using FOR removes old numbering
		#	renumbers
		#	mv old to new
		#  	Run from actual directory
		cd ~/Downloads/mp3/from_youtube

		#	Remove path, number; 
		for s in ~/Downloads/mp3/from_youtube/*
		do
			# proposed name before & after
			oldname="$(echo "${s##*/}")"	# no need to strip off directory
			newname="$(echo ${s##*/} | sed -E 's/^[0-9]{1,6}//') "

			# b/c file names begin "-"  use "./" as prefix
			mv "./""${oldname}"  "./""${newname}"

		done
		cd -	# return to here
		;;
	30)	#Works
		# while loop is safer?
		# note OR in find
		find ~/Downloads/mp3/from_youtube -name "*.ogg" -o -name "*.mp3" \
			| while read f; do
			# show proposed name before & after
			echo "${f##*/}" "\n -> " \
				"$(echo ${f##*/} | sed -E 's/^[0-9]{1,6}//') "
		done

		;;
	31)	# Same as 30) but saves list to file
		# remove number, save to file
		find ~/Downloads/mp3/from_youtube -name "*.ogg" -o -name "*.mp3" \
			| while read f; do
		echo "$(echo ${f##*/} | sed -E 's/^[0-9]{1,6}//')" \
		>>  40_no_number.txt  
		done
		;;
	32) # remove number and MOVE 
		find ~/Downloads/mp3/from_youtube -name "*.ogg" -o -name "*.mp3" \
			| while read f; do
		x="$(echo ${f##/})"
		oldname=echo "$(echo ${f##/})"
		newname=echo "$(echo ${f##*/} | sed -E 's/^[0-9]{1,6}//')" 
		echo "${x}"
		echo "${oldname}"
		echo "${newname}"
		done
		;;
	50)	# works!
		pre=1
		find ~/Downloads/mp3/from_youtube -name "*.ogg*" -o -name "*.mp3*" \
			| while read f; do
		# here, same as 40
		echo "$(echo ${f##*/} | sed -E 's/^[0-9]{1,6}//')" \
		>>  40_no_number.txt  
		# add pre, format for 5 digits
		echo "$(printf "%05d\n" "${pre}")""$(echo ${f##*/} | \
			sed -E 's/^[0-9]{1,6}//')" \
		>>  50_new_number.txt  
		((pre++))
		done
		;;
	60)
		pre=1
		find ~/Downloads/mp3/from_youtube -name "*.ogg*" -o -name "*.mp3*" \
			| while read f; do
			oldname="$(echo "${f##*/}")"	# no need to strip off directory
			newname="$(echo "$(printf "%05d\n" "${pre}")""$(echo ${f##*/} | \
				sed -E 's/^[0-9]{1,6}//')" )"
			echo "${oldname}"
			echo "${newname}"
			# b/c file names begin "-"  use "./" as prefix
			mv "./""${oldname}"  "./""${newname}"
		((pre++))
		done
		;;

	61)	# Works!
		cd ~/Downloads/mp3/from_youtube
		pre=1
		find ~/Downloads/mp3/from_youtube -name "*.ogg*" -o -name "*.mp3*" \
			| while read f; do
			#echo "${f}"
			#echo "${f##*/}"	#
			oldname="$(echo "${f##*/}")"	# no need to strip off directory
			newname="$(echo "$(printf "%05d\n" "${pre}")""$(echo ${f##*/} | \
				sed -E 's/^[0-9]{1,6}//')" )"
			echo "${oldname}"
			echo "${newname}"
			echo " "
			# b/c file names begin "-"  use "./" as prefix
			#mv "${oldname}"  "./""${newname}"
			mv -- "${oldname}"  "${newname}"
			echo " "
		((pre++))
		done
		cd -
		;;

	62) # -- works, find non-audio files
		# list files NOT mp3 and NOT ogg
		find ~/Downloads/mp3/from_youtube \
			\( \!  -name "*.ogg*" -a \
			   \!    -name "*.mp3*" \) \
			| while read f; do
			echo "$f"
		done
		;;
	70) 
		# Works
		# USE:  1st run 23 (remove old), then run 70
		# BOTH:  remove old number, renumber and mv!
		# BUT   "for" not best way
		#
		pre=1
		cd ~/Downloads/mp3/from_youtube
		for s in ~/Downloads/mp3/from_youtube/*
		do
			oldname="$(echo "${s##*/}")"	# no need to strip off directory
			newname="$(echo "$(printf "%05d\n" "${pre}")""$(echo ${s##*/} | \
				sed -E 's/^[0-9]{1,6}//')" )"
#			echo "${oldname}"
#			echo "${newname}"
			# b/c file names begin "-"  use "./" as prefix
			mv "./""${oldname}"  "./""${newname}"

		((pre++))
		done
		cd -	# return to here
		;;
	71)	# cleanup!	
		# FILE NAMES, remove all   - (dash)
		for s in ~/Downloads/mp3/from_youtube/*
		do
			oldname="${s}"
			#   's/-/_/g'    
			#   get rid of single quotes (escape \')

			newname="$(echo "${s}" | sed -E "s/ogg  _/ogg/")"
			# Next 2 lines:   alternate to test, to actually run
			echo "${newname}"
			#mv "${oldname}" "${newname}"
		done
		;;
	80)	# Sort size, descending
		#	A skip . .. files
		#	s show size
		#	S sort
		cd "${the_dir}" 
		ls -AsSh			# add -r for asc
		cd -
		;;

	81)	# just testing functions
		get_old_name(){
			echo "${1}"
			echo "${1##*/}"
		}
		get_old_name $PWD
		;;
	82)
		# sort depends on LC_LOCALE
		# see-https://unix.stackexchange.com/questions/477998/why-does-sort-say-that-%C9%9B-e?noredirect=1&lq=1	
		# see- https://unix.stackexchange.com/questions/87745/what-does-lc-all-c-do#87748
		#
		sort_on_column_n(){
			pushd ${the_dir}
			ls -1 * | sort -n -k1.${1}	
			popd
		}
		sort_on_column_n 4 
		;;
	clean)	
		rm 40_no_number.txt
		rm 50_new_number.txt
	
esac


