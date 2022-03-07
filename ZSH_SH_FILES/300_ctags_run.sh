#!/bin/zsh

# ==================================
# run ctags
#		-f  resulting file
# 	-R  recursive
#		~/code  start with this directory.

ctags -f ~/code/tags  -R ~/code
# ==================================
