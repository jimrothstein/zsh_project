#!/bin/zsh


# 200_list_array_elements.sh
#
#  Wed Sep 16 01:26:31 PDT 2020
# /home/jim/code/zsh_scripts_project


# ==================================================================
#  Enumerate elements of array
# ==================================================================
#
# ========================================
# 	in normal mode:
#
# :r !pwd:   /home/jim/code/bash_project
#	:r !date (to insert date)
#	"% p  " file name
#
# ========================================
# 
#
#
# $path, $cdpath $fpath are ENV variables
for e in $path[@]; echo $e

	print "cdpath"
for e in $cdpath[@]; echo $e

for e in $fpath[@]; echo $e
