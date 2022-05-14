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
# Example:
#						072_echo_args 1 2 3
#						072_echo_args a b '\\b'    # single quote, \b
#						072_echo_args a b "\\b"    # double quote, 
#
# ================================
#
echo $*

exit




