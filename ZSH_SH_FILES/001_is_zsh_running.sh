#!/bin/zsh 

# Test:  if ZSH shell running?


if [ -n $ZSH_VERSION ]; then
    echo $ZSH_VERSION
else
    echo "ZSH not running"
fi

echo " next ..."

