#!/bin/zsh
# 031_sed_examples.sh


files=($HOME/Downloads/mp3/from_youtube/*)

#	change 000 to ZZ{{{
INCLUDE=FALSE
if test ${INCLUDE} = TRUE
then
print "*** use sed, to s/r, print screen ***"
for f in "${files[@]}"
do
	echo "${f}" | sed 's/000/ZZ/'
done
fi
exit
# }}}
#
#	list files{{{
INCLUDE=TRUE
echo "hi"
if test ${INCLUDE} = TRUE
then 
for f in "${files[@]}"	
do
	echo "${f}"
done
fi
# }}}
#



INCLUDE=FALSE
if test ${INCLUDE}=TRUE
then
	print "*** same, but ...."
	print "*** use sed, to s/r with regex, print screen ***"
	for f in "${files[@]}"
	do
		echo "${f}" | sed 's/^[0-9]{4,6}//'
	done
	INCLUDE=FALSE
	exit
fi


