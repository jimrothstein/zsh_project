#!/bin/zsh

#  cd directory OR  throw error
# at CLI,  echo $?  is non-zero when error occurred.

DIR="junk"
E_CODE=99


cd $DIR || {
    echo "Jim says an error occurred:  no such directory,  error code=${E_CODE}"
}

#    echo "type echo '$?' ; non-zero means an error"

