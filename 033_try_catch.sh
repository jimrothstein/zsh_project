#!/bin/zsh
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
#
#
#
nvim -u NONE -c 'try | source vimrc-fail | catch | cq | endtry | q'; echo $?

