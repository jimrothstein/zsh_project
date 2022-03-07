#!/bin/zsh
#
# file <- "072_echo_args.sh
#
#
  
# ================================
# USAGE:  ./072_echo_args  "hello" "bye"  \\-X
#
# DESCRIBE:  Echo back ARGS.
#
# Details:   Just echo back what zsh | echo THINKS are args you sent.
#           Useful to debug, understand what is going on.
#
# ================================
#
echo $*

exit

