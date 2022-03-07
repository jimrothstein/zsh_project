
#!/bin/zsh



# file = "063_CLI_rename.sh" 

# =================================================
# PURPOSE:   At CLI, change file names with regex
# =================================================
#
#
# ======================================
# USEAGE    rename -n -v '<expr>'   *
# *  -n  dry run
# *  -v  if both -n, -v used;  reports predicted changes; but NOTHING does
# change.
# ======================================
#
# ====================================
# EXAMPLE:  rename 's/.prog/.prg/  *
#  * In all files, rename any .prog to .prg
#
# EXAMPLE:  rename 's/\.prog$/.abc' *
#  * In all files, rename only those that END in .prog to END in .abc
#  * \.  means want literal period, not symbol to denote any 1 character.
#
#  EXAMPLE:  rename 's/^_[0-9]{3,6}/_/'   *.ogg
#  *  Any ogg file that begins "_" with 3-6 digits, followed by "_" 
#  *  USEFUL for mp3
#
#  EXAMPLE:   use of -e or -E  (perl)   I do not undertsand
#
# NOTES:
#   *  use "Larry Wall" version
#   *  not use "util-linux" version
# ====================================
