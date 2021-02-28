#!/bin/zsh
#
#  070_run_R_example.sh
# This zsh script runs R at CLI; execute a R command; then exists
  
# ================================
# USAGE:  ./070_run_R_example.sh
#
# RMK:  chmod u+w ./070_run_R_example.sh
# u = user
# g = other users in group
# o = others
#
# a = ALL
# ================================
#
R --no-save --no-restore << EOF
  print("hi")
  version  # not a function
EOF
