#!/bin/zsh
## file <- "610_exec_to_redirect.sh"

#	======================================================
##	PURPOSE:		redirect all output as described by exec 
##	USAGE:			./600_exec_to_redirect.sh
##	NOTES:
##				exec > test.log will include only non-errors
##				exec > test.log 2>&1 will ALSO send errors to both std out and file
#	======================================================


exec > test.log 2>&1 

ls -la
echo $(date)

##	uncomment to force error
#		error
