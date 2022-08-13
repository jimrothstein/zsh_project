#!/bin/zsh


#	Thu 04Aug2022
# ----------
#	USE pandoc to create .pdf to STDOUT (normally send to a file.pdf) 
#		AND display with zathura.   In zathura can save, if desired.   In zathura
#		can save, if desired
# use:  script md_file
# USAGE:	./029A_create_and_view_pdf % 
#
# TODO:	use $2, but convince pandoc to produce pdf
# ----------
#
#
echo "$0"
echo "$1"
echo "$2"
echo " "

output="output.pdf"

create_pdf() {
	# %1 arg is file
	# and must be .md file
	# -t latex is pdf
	# -o -    is forcing output t STDOUT
	pandoc -f markdown -t pdf "$1" -o - | zathura - 
}

create_pdf "$1"

#		zathura ${output} 

