#!/bin/zsh
# file <- "025A_simple_change_file_name.sh#	025_glob_for_PE_sed_examples.sh"
# -------------- --------------
#	"%p      #insert name of current file
#	BEST:  https://mywiki.wooledge.org/UsingFind
# -------------- --------------
#
#   Other .sh files much better ways to change file names.
#   Here are 2 quick and dirty ways.
#
#   Goal:   change A.file  to B.file
#
#   rename 's/^A/B/' *
#
#   old="A.file"
#   new=$(echo "$old" | sed -e 's/^A/B/')
#   mv "$old" "$new"
#
#   SED normally used to change contents in the ENTIRE file.  Not just name.
