#!/bin/zsh
#
#  071_run_R_to_upadate.....sh
# This zsh script runs R at CLI; execute a R command; then exists
#
# Even if install errors, will complete and exit to zsh prompt.
#
#
  
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
update.packages(ASK=FALSE)
quit()
EOF



exit
R --no-save --no-restore << EOF
update.packages(pkgsold = old.packages())
quit()
EOF

