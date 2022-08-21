#!/bin/zsh
#		file <- "074_list_all_pdf_files.sh#"
#
##	TODO	
#		-		remove permisisons from listing
#		-		replace date -I (has dashes) with better date format
#
#

# ===================
#   USAGE:  ./074_list_all_pdf_files.sh
#
#   PURPOSE:    Return files matching the glob **/*.pdf (recursive0
#								Prints to console.
#								And, prints to specified dir/file
#
#   Details:    
#				-	NOTE: use full canonical file name for use in root or parent 	directories
#
#
# ===================
#

#
#	----------------------------
#			DETAILS	
#
#	-h human
#	-R recurse all directories
#	-1  one per line
#	-o  no owner
#	-g  no group

#	tee does the following
#		-	allows preceding ls to list to console, untouched
#		- ALSO directs output to dir/file indicated
#		-	Do not need any > or >>
#----------------------------
#
cd ~

export the_dir=~/Downloads/print_and_delete

ls -1Rhog **/*.pdf  | tee ${the_dir}/"$(date -I)"_list_all_pdf_files.txt


exit





