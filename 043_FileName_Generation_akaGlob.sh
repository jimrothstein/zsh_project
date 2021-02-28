
#!/bin/zsh
# ----------------------------
#	FILE:	043_FileName_Generation_akaGlob.sh	
# 	DIR:	/home/jim/code/bash_project
# ----------------------------
# 	USAGE:	./032... 1
#   PURPOSE:  GLOB (filename generation)	
#   SEE ALSO: zsh:guide; 3.6.5  and chapter 5 
# ----------------------------

case $1 in
	1)
		print ~/*		# expand (to home) then match files
		echo ""
		;;
	11)
		x=*
		print ~/$x		# only prints "/home/jim/*"
		print ~/${~x}	# but this lists all files
		;;
	*)
		echo "usage:   !zsh % 1|2|3"
esac

