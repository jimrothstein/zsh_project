
#!/bin/zsh
# ----------------------------
#	FILE:	042_parallel.sh
# 	DIR:	/home/jim/code/bash_project
# ----------------------------
# 	USAGE:	042_parallel.sh
#   PURPOSE:  use parallel command to process in chunks	
#   SEE ALSO:  
# ----------------------------
#
case $1 in
	10)
		# list files, groups of 2, to command cat 
		# {} is placeholder for stream
		ls * | parallel -j 2 cat {}
		;;
	20)
		# same
		ls *.sh > junk
		parallel -j 2 cat {} < junk 
		;;
	21)
		ls ~/Downloads/mp3/from_youtube/* | parallel echo {}
		;;
	22)	
		# nice info,   -j+0 means run all cores
		ls ~/Downloads/mp3/from_youtube/* | time parallel -j+0 --eta echo {}  
		;;
	23)
		# nice info,   -j+0 means run all cores
		ls ~/Downloads/mp3/from_youtube/* | time parallel -j+0 --eta 'echo {}'
		;;
	24)# echo{/} removes path!
		ls ~/Downloads/mp3/from_youtube/* | time parallel -j+0 --eta 'echo {/}'
		;;
	25) # all FAILs
		ls ~/Downloads/mp3/from_youtube/* | time parallel -j+0 --eta 'echo {/}'
		#| echo {= s/^[0-9]{2,6}// =}
		;;	
	28) #FAILS
		ls ~/Downloads/mp3/from_youtube/* | time parallel -j+0 --eta "$(echo {} )" 
		;;
	29) # FAILS
		ls ~/Downloads/mp3/from_youtube/* | parallel echo "${\{\}##*/}"
		;;
	30)
		for s in ~/Downloads/mp3/from_youtube/*
		do
			echo "${s##*/}" # remove path
		done
		;;
	40)	# FAILS
		do_it () {
			echo "${1##*/}"
		}
		export -f do_it
		cat $(ls ~/Downloads/mp3/from_youtube/*) | parallel -j 4 do_it
		;;

	50)	#substution
		parallel echo '{= s/a/b/ =}' ::: a aa ac ca
		;;
	51)	# Works
 		parallel echo '{= s/^[0-9]{4,6}$// =}'  ::: 1a aa 223 1234 3422 999999 12345678
		;;	

	52)	# NOPE
		ls ~/Downloads/mp3/from_youtube/* | parallel echo  '{= s/^[0-9]{4,6}//
		=}'
		;; 
	53)
		 parallel echo{/} | echo  '{= s/^[0-9]{4,6}// =}' :::  ~/Downloads/mp3/from_youtube/* 
		 ;;
	54) # this works??
		parallel 'a={}; name=${/}; echo $name' ::: ~/Downloads/mp3/from_youtube/*
#		find . | parallel 'a={}; name=${a##*/};' \
#    'upper=$(echo "$name" | tr "[:lower:]" "[:upper:]");'\
#    'echo "$name - $upper"'
	;;
	55) # NOPE

		parallel 'a={/};' 'x="$(echo $a | {= s/^[0-9]{2,6}// =})";' 'echo $x ' ::: ~/Downloads/mp3/from_youtube/*
		;;

	*)  echo "usage !zsh % 10"
		;;

esac
