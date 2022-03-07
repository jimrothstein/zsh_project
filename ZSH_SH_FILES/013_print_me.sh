#!/bin/bash
# 013_print_me.sh

#-----------------
# copy file to  print folder
#-----------------
# TAGS:  cp,arg


# arg $1 is the file
echo "$1"
cp "$1" ~/Downloads/print_and_delete
exit

