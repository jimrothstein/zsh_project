#!/bin/zsh

# create /tmp/sandbox 
mkdir /tmp/sandbox

cd /tmp/sandbox

git init

echo "1"  >> example
git a
git cm "first commit"

echo "2" >> example
git a
git cm "first commit"



