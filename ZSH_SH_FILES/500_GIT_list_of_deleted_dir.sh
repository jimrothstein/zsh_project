#/bin/zsh


usage () {
    echo "usage:  `basename $0` [<options>]"
    exit 1  
}

# usage

#  This script lists all DIR that remain in GIT index but have been deleted.
#       Process index in CURRENT DIR
#       Creates file `delete_dir`


git log --all --pretty=format: --name-only --diff-filter=D | sed -r 's|[^/]+$||g' | sort -u >> deleted_dir
#   --diff-filter=D  means select only DELETED 
