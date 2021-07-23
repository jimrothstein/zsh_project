#!/usr/bin/zsh 
## REF:  https://git-rebase.io/

## pause function
## REF: https://stackoverflow.com/questions/5215343/how-can-i-pause-in-zsu
pause()
{
    echo "$*"; read -k1 -s
}


## create sandbox; cd to directory
  git init /tmp/rebase-sandbox
  cd /tmp/rebase-sandbox
  git commit --allow-empty -m"Commit 0"

## why no work?
  export the_dir=/tmp/rebase-sandbox
  export the_script=~/code/zsh_scripts_project/
#  pause "hit keey"

## show files, pause
   ls -la * 
#  pause "files ok?"


## commit 1
  echo "Hello" > ${the_dir}/greeting.txt
  git a
  git commit -m "commit1"


## commit 2
  echo "by" > ${the_dir}/bye.txt
  git a
  git commit -m "commit2"

## oops, need to fix prior commit!
  echo "Hello world" > ${the_dir}/greeting.text
  git a
  git commit -m "commit3"

## but history is messy
  git log --oneline
  pause "check log, need to fix: try autosquash"








