#!/bin/zsh
# file <- "073_function_find_filename.sh"

# ===================
#   USAGE:  ./073_function_find_filename "*.sh"
#
#   PURPOSE:    Return files matching the glob in arg $1
#
#   Details:    Grep alone DOES NOT search for names of filenames, though ll
#   *.sh will.  This function is fake mimic of grep, but uses correct zsh
#   command:  find.
# ===================
#

f() {
    find . \
        -name \
        "*$1*" 
    }

f $1

#   f 'judith'
#f ".sh"
exit
