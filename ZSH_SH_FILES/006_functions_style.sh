#!/usr/bin/zsh

# SEE "Bash Ref Manual"  -- all tests

# ====================
# functions_style.sh
# ====================

# see https://codereview.stackexchange.com/questions/181855/script-to-create-symlinks-for-dotfiles-in-a-git-repository
# TAGS:  function


file_exists() { test -e "$1"; }

# arg positions
file_loc="$1"
symlink_loc="$2"

if ! file_exists "$file_loc"
  then
  # return invalid_file_error "$file_loc" 
    echo "error ...."
    exit  99
fi


#!/bin/bash
# ~/code/.../010_test_files.sh


#### 2 files same? ####
## note:   left is a symlink
##	   right is real file
## see:	man test
## true if same inode
if [[ ~/.bashrc -ef ~/dotfiles/.bashrc ]]
then
    printf 'They are the same file\n'
    exit 
    else
	    echo "not the same"
	    exit
    fi

exit
########################	   

# Error Handling

DIR="junk"
E_INVALIDDIR=99

cd $DIR || {
	echo "no such directory" &>	# suppress shell error??
	exit $E_INVALIDDIR
}
exit
##########################



#### ROOT? ####
ROOT_UID=0			# if root
E_NOTROOT=87			# constant, if not root

if [[ "$UID" -ne "$ROOT_UID" ]] 
then
	echo "must be root"
	echo 'type echo $? for error'
        exit $E_NOTROOT         # number                                                                                                                                  
fi
################


#### BASH Running? ####
if [ -n "$BASH_VERSION" ]; then 
	echo "$BASH_VERSION"
else
	echo "BASH not running"
fi 

