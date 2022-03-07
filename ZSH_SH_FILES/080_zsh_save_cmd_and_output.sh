#!/bin/zsh
#
#


##### PURPOSE:   in zsh, save both command and its output to file.  Later,
#markup will be added to the file.
#
## turn on   (turn off NOVERBOSE NOXTRACE)
setopt VERBOSE
setopt XTRACE
    

(echo foo | grep -oP 'f' >> junk)
set +xv
cat junk

exit


