#!/bin/bash
# 019_basic_cmd_expansion


#####################	
#	file cmd, do not understand output
#
#####################	
# /usr/bin/*   what is in it?


DIR="~/*"
file $(ls "${DIR}" | grep .)
exit

file ~/* | grep .								# works
echo "#############"

# what is difference?
file $(ls ~/* | grep .)							# why subdirectories included?
exit


# finally what I really want
file $(ls /usr/bin/* | grep zip)
exit
##################3
#
echo "directory listing $(ll)"					# fails	!  ??
echo "directory listing $(ls -la)"

echo "directory listing $(ls)"					# works
echo "dpkg log $(tail -n10 /var/log/dpkg.log)"	# works




