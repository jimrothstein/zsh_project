#!/bin/zsh 


# M-x shell-script-mode - which is ??

# M-!    run one shell cmd in mini-buff
# M-! ls

# M-:

# position point at end of next line
# C-M-x  to evaluate



whereis bin
who 
date
ls -lo *.sh 
file 001_is_zsh_running.sh 


file *.sh 

info emacs 




# Test:  if ZSH shell running?


if [ -n $ZSH_VERSION ]; then
    echo $ZSH_VERSION
else
    echo "ZSH not running"
fi

echo " next ..."

