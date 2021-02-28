
#!/bin/zsh
# ----------------------------
#	FILE:	036_grymoire_sed_examples.sh
#   PURPOSE:  	find for PE change names ... {} \;
#   SEE ALSO:  woolridge: https://mywiki.wooledge.org/BashFAQ/073
# ----------------------------
#	group:   put parathesis around matching patterns
#	*   0,1,n
#	.	exactly 1
#	?   
#	+	1,n
echo "abc2abc" | sed -E 's/[a-z]*/(&)/g'	# (abc)2(abc)
echo "abc2abc" | sed -E 's/[a-z]*/---&---/g'	# (abc)2(abc)
echo "abc2abc" | sed -E 's/[a-z]*/(&)/g'	# (abc)2(abc)

