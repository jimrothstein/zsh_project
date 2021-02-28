#!/bin/zsh

# ----------------------------
# 	/home/jim/code/bash_project
#	060_find_jpg_example.sh
# ----------------------------
# ----------------------------
#   see woolridge: https://mywiki.wooledge.org/BashFAQ/073
# ----------------------------
#
#
#
# set dir
dir=~/Downloads/print_and_delete/


# begin with that dir, file files matching -name, 
# then ask to delete or not.  {} represents set of matched files.
# ends with ;    but must protect from shell
find ${dir} -name '*.jpg' -ok rm {} ';'
exit


# =============
# LEGACY CODE
# =============
#
INCLUDE=FALSE
# create array, using glob
songs=($HOME/Downloads/mp3/from_youtube/*)
dir=~/Downloads/mp3/from_youtube/

myArray=$(find ${dir} -type f)

INCLUDE=FALSE
echo ${INCLUDE}

#from woolridge

if test ${INCLUDE}
then
##  HOLD --this is PE
	find . -type f -execdir zsh -c '/
	dest=${1//[0-9]/} /
	cp -- "$1" "$dest" /
	' _ {} \;
fi

INCLUDE=FALSE
if test $INCLUDE = TRUE
then
	find ${dir} -type f -execdir ls -hsS {} +
fi

# ---------------
# NOTES:
# 	-execdir (preferred) uses dir from find
# 	-exec (avoid) uses dir command is run int
#
# 	- {} + (preferred ) things seem to work better
# 	- {} \; (older)
#
# 	- do NOT use $(command) after -execdir
# ---------------
#	Also work:
# 		   
# find ${dir} -type f -execdir ls -hsS {} +   wrong form, but works!
# find ${dir} -type f -execdir zsh -c 'ls -hsS' {} +	BEST!kkkkk
# find ${dir} -type f | grep -E "[Jj]udith"
# find ${dir} -type f -exec echo {} \;
# find ${dir} -type f -print
#
# find ${dir} -type f | grep -E "[Jj]udith"  
# 
#
# add command:

INCLUDE=FALSE
if test $INCLUDE = TRUE
then
	find ${dir} -type f -execdir zsh -c 'name=${1}; \
	new=${name//^[0-9]{4-6}/}; \
	echo ${new} ' _ {} +
fi

INCLUDE=TRUE
if test $INCLUDE = TRUE
then
	for s in "${songs[@]}"
	do
		name="${s##*/}"; \
		new=${name//[0-9]{4-6}/"***"/}; \
		echo "*** "${new} 
	done
fi
