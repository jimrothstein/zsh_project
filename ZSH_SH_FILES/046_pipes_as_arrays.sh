
#!/bin/zsh
# ----------------------------
#	FILE:	
# 	DIR:	/home/jim/code/bash_project
# ----------------------------
# 	USAGE:	
#   PURPOSE:  	
#   SEE ALSO:  
# ----------------------------
# function
targets() {
    echo ~/Downloads
    echo ~/code
}

# fct output appears as array!
targets | while read -r targ; do
    ls -la $targ
done
