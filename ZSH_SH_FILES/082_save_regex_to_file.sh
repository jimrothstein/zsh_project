#!/bin/zsh 
#   082_save_regex_to_file.sh
#
#	REF"
# https://blog.tratif.com/2023/01/09/bash-tips-1-logging-in-shell-scripts/?utm_source=pocket_saves
#
#	PURPOSE:   zsh shell script to timestamp a log file
#	USAGE:  ./081_FD_save_to_log.sh
#
#	TODO: 
#		-	not clear, show msg & time stamp in log.log
#		-	show msg & timestamp in BOTH console and log.log
#
# 1 >"log.log"   , stdout now appears in log.log
# 2 >&1		, stderr now appears in log.log
# 3 >&1		, this process ?? appears in log.log
log() {
    #echo "[$(date -Is)]" "$@"
    echo "[$(date -I"minutes")]" "$@"
}

LOGFILE="./regex.log"
set -x  # print line of code, before evaluated 
exec 3>&1 1>"$LOGFILE" 2>&1

#  
date -I"minutes"
echo "hi"   # appears in log.log;  NOT in console
echo "1"
echo "2"
echo "3"
echo "hi1" >&3   # console, only; not log.log

echo "abc" | grep -P "a"

log "without redirect" 
log "with redirect"	>&3
