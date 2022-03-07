
#!/bin/zsh
# ----------------------------
#	FILE:	035_substitute_examples.sh
# 	DIR:	/home/jim/code/bash_project
# ----------------------------
# 	USAGE:	./035... 1
#   PURPOSE:  	
#   SEE ALSO:  
# ----------------------------
# line1: joe
# :11s/jim/joe/

http:// 
# :14s/^http:/https:/c
# :-2s/^https:/http:/c

jim
# -1s/jim/\= strftime("%d %b %Y")/c
