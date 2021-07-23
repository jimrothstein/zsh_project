#!/bin/zsh
# ----------------------------
# "006A_is_var_set.sh"
# ----------------------------
# TAGS:  if, exists

#### -n var set?	#### 

# Choose one
X="hello"
X=""

if [[ -n $X ]] ; then
	echo $X			#  if set, or if X set to null, then true
else
	echo "X never set "
fi

