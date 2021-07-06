#!/usr/bin/zsh 
## REF:  https://git-rebase.io/

## pause function
## REF: https://stackoverflow.com/questions/5215343/how-can-i-pause-in-zsu
pause()
{
    echo "$*"; read -k1 -s
}

## Fails
##  read -s -k $'?Press any key to continue ... '
  

## create sandbox; cd to directory
  git init /tmp/rebase-sandbox
  cd /tmp/rebase-sandbox
  git commit --allow-empty -m"Commit 0"
  pause "hit keey"

## show files, pause
  ls -la * 
  pause "files ok?"


## commit 1
echo "Hello" > $the_dir/greeting.txt
exit
git a
git commit -m "commit1"







