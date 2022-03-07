#!/bin/zsh
#	025_glob_for_PE_sed_examples.sh
# -------------- --------------
#   /home/jim/code/bash_project
#	Sun Jan 27 16:11:37 PST 2019
#	"%p      #insert name of current file
#	BEST:  https://mywiki.wooledge.org/UsingFind
# -------------- --------------
INCLUDE=FALSE

# use glob
songs=($HOME/Downloads/mp3/from_youtube/*)
dir=~/Downloads/mp3/from_youtube
# ------------------------
#	for -
# ------------------------
# 

## careful ##
if ${INCLUDE}=TRUE
then
	pre=0  # prefix
	ext=   # empty
	for i in * # each file
	do
		echo ${i} 
	done
	#	mv "$i" "$pre_$i"
	#	((pre++))
	#	do

	## next line creates new file!
	#mv "$i" "${i/.sh/_ex.sh}"
	#  echo ${i} done
fi
# ------------------------
#	use globs, for
# ------------------------
# 
if test ${INCLUDE} = TRUE
then
#	glob to store in array;  print as 1 string
files=(*)
echo "${files[@]}"
fi

if test ${INCLUDE} = TRUE  
then
print "*** print all files in array; 1 per line ***"
for f in "${files[@]}"
do
	echo "${f}"
done
fi



INCLUDE=FALSE				#Works!
if test ${INCLUDE}=TRUE
then
	print "for, find, echo "
	
	for f in "${songs[@]}"
	do
		echo "${f##*/}"
	done
fi

INCLUDE=TRUE				# Works
if test ${INCLUDE}=TRUE
then
	print "for, find, echo "
	files=$(find ${dir} -name "*.mp3")
	for f in "${files[@]}"
	do
		echo "${f##*/}"
	done
fi
INCLUDE=FALSE
exit

if test ${INCLUDE} = TRUE
then
	print '*** ${VAR/s/r} ***'
	for f in "${files[@]}"
	do
		echo "${f/_/ZZ}"
	done
fi

if test ${INCLUDE}=TRUE
then
	print '*** ${VAR/s/r} NO! ***'
	for f in "${files[@]}"
	do
		echo "${f/'^[0-9]{3}'/ZZ/}"
	done
fi

