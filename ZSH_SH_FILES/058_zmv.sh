
#!/bin/zsh
# ----------------------------
#	FILE:	032_find_for_PE_sed_name_change.sh
# 	DIR:	/home/jim/code/bash_project
# ----------------------------
# 	USAGE:	./032... 1
#   PURPOSE:  	find for PE change names ... {} \;
#   SEE ALSO:  woolridge: https://mywiki.wooledge.org/BashFAQ/073
# ----------------------------
autoload -Uz zmv

# default = off
setopt extendedglob

# zmv does NOT use regex

case $1 in
	10)
		uppercase_file_names_zmv_dry_run(){
		zmv -n '(*)' '${(U)1}'
	}
		uppercase_file_names_zmv_dry_run
		;;
20)
		zmv -nv '(*)'.sh '$1.SH'
		;;
30)
		zmv -nv '(* *)'.zz '$1.ZZ'
	;;
40)
		zmv -nv '(* *)' '${1/ /_}'
	;;
50)
		pushd ~/downloads/mp3/from_youtube/		
		zmv -nv '(* *)' '${1// /_}'	# done, works!	
		popd
	;;
60)
		pushd ~/downloads/mp3/from_youtube/		
		#zmv -nv '(*\'*)' '${1//\'/_}'	
		popd
	;;
61)		# Works! TWO patterns, increment number
		pushd junk
		zmv -nv '(folder)(<->)' '$1$[$2+200]'	
		popd
	;;
62)		# Works! 63) undoes this
		pushd junk
		zmv -v 'dir(<->)' 'folder$1'	
		popd
	;;
63)		# undoes 62) 
		pushd junk
		zmv -v 'folder(<->)' 'dir$1'	
		popd
	;;

	*)
esac

