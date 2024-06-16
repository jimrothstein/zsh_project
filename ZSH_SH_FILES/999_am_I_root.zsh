#!/bin/zsh

ROOT_ID=0

# To run as root, first `sudo su`  then run script

if [[ $UID -ne $ROOT_ID ]]
then
    echo "you are NOT root"
fi
