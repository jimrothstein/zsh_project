#!/bin/zsh
#
#

# PURPOSE:   Simple one line sed commands, mostly to test regex scripts
# HOWEVER:   Unlike grep, sed prints COLOR only with inerting color code (not
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

echo "abc2abc" | sed -E 's/[a-z]*/(&)/g'	# (abc)2(abc)
echo "abc2abc" | sed -E 's/[a-z]*/---&---/g'	# (abc)2(abc)
echo "abc2abc" | sed -E 's/[a-z]*/(&)/g'	# (abc)2(abc)
line_break="--------------"
print ${line_break}
str="hello"
r="h"
echo $str | grep -E "$r" -

#2

print ${line_break}
str="Surely this regular expression should match this." 

r="this."

echo $str |  grep -E "$r" -

print ${line_break}
echo "grep"
str=pop non mom tot top bop


print ${line_break}
echo ${str}
echo ${str}  | grep -P "^(.)o\1$" --color=always

echo "sed"
echo "pop non mom tot top bop" | sed -E '/\b(.)o\1\b/p'
echo "pop non mom tot top bop" | grep -P '\b(.)o\1\b' --color=always
print ${line_break}
