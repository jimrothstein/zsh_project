#!/bin/zsh
#

# PURPOSE:   Simple one line sed commands, mostly to test regex scripts
# HOWEVER:   Unlike grep, sed echos COLOR only with inerting color code (not
# hard -- see !so) but STAY with GREP for now.

# -----------------
#  STAY WITH GREP
# -----------------

# ----------------------------
#	group:   put parathesis around matching patterns
#	*   0,1,n
#	.	exactly 1
#	?   
#	+	1,n

alias grep='grep --color=always'
echo ${line_break}
echo "abc2abc"

echo "abc2abc" | sed -E 's/[a-z]*/(&)/g'	# (abc)2(abc)
echo "abc2abc" | sed -E 's/[a-z]*/---&---/g'	# (abc)2(abc)
echo "abc2abc" | sed -E 's/[a-z]*/(&)/g'	# (abc)2(abc)
line_break="--------------"
echo ${line_break}
str="hello"
r="h"
echo $str | grep -E "$r" -

#2

echo ${line_break}
str="Surely this regular expression should match this." 

r="this."

echo $str |  grep -E "$r" -



# --------------------------------
echo ${line_break}
echo "Match when Judith appears twice ..."
echo "But to match Judith ...judith MUST use grep -iP "
str=XJudithxxjudith
regex='([Jj]udith)(\w*)\1'
#regex='([Jj]udith)(?:.*)\1'
echo $str
echo $regex

echo $str | grep -Pi $regex

# --------------------------------
echo ${line_break}
echo "grep"
str='pop non mom tot top bop'
echo ${str}
echo ${str}  | grep -P "^(.)o\1$" --color=always

echo "sed"
echo "pop non mom tot top bop" | sed -E '/\b(.)o\1\b/p'
echo "pop non mom tot top bop" | grep -P '\b(.)o\1\b' --color=always
echo ${line_break}




# --------------------------------
# Fix _NA_
echo "Fix _NA_"
echo "_NA_" | sed -E 's/_NA_/_/'
# --------------------------------
echo ${line_break}

# --------------------------------
# Rewrite a date:  from "2021-12-13"
# sed does NOT use \d
echo "2021-12-13" | sed -E 's/([0-9]{4})-([0-9]{2})-([0-9]{2})/\3MONTH\1/'

# ---------------------
#   print directories
# ---------------------
echo $line_break
echo "print directories"
ls -l | sed -n -e '/^d/p'
echo $line_break

