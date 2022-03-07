#!/bin/zsh
" file <- "033_try_catch.sh#"
# ------------------------
#	TRY-CATCH
#
# 	-u NONE		# do not source .~/vimrc
# 	:cq  		# vim returns with non-0 exit
#	-c			# run following Ex command 
# ------------------------
#
# 
#
#
#
# try sourcing file DNE
# '|' means run sequentially
#
#
nvim -u NONE -c 'try | source vimrc-fail | catch | cq | endtry | q'; echo $?

