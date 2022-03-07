#!/bin/zsh

# /home/jim/code/bash_project
# Thu Jan 17 19:11:16 PST 2019

# ----------
# create pdf from .md
# use:  script md_file
# ----------
#
#
echo "$0"
echo "$1"
echo " "


create_pdf() {
	# %1 arg is file
	# and must be .md file
	# -t latex is pdf
	pandoc -f markdown -t latex "$1" -o output.pdf
}

create_pdf "$1"


