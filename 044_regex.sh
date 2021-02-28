#!/bin/zsh
# ----------------------------
#	FILE:	032_find_for_PE_sed_name_change.sh
# 	DIR:	/home/jim/code/bash_project
# ----------------------------
# 	USAGE:	./032... 1
#   PURPOSE:  	find for PE change names ... {} \;
#   SEE ALSO:  woolridge: https://mywiki.wooledge.org/BashFAQ/073
# ----------------------------
VIRTUAL_ENV=/Users/foo/.virtualenvs/venv-test-server

regex="^.*\/venv-(.*)$"
if [[ $VIRTUAL_ENV =~ $regex ]] ; then
  echo "Matched!"
  echo ${BASH_REMATCH[1]}
fi
