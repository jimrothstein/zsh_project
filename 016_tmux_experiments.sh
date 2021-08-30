# file <- "016_tmux_experiments.sh"

[~/code/MASTER_INDEX.md]
[~/code/zsh_scripts_project]

tmux set -g status-left-length 60
tmux set -g status-utf8
tmux set -g status-left "#[fg=green]#S#[fg=yellow]:#W:#I#[fg=cyan].#P"
tmux set -g status-right "#[fg=cyan]%d %b %R"
tmux setw -g monitor-activity on
tmux set -g visual-activity on

#!/bin/bash

S=jimSession
W=jimWindow
P=jimPanel

# open new session, named $S:1
tmux new-session -s $S -d

# rename it
tmux rename-window $W

# split window into panes
tmux split-window -h

# select pane 1 (begins at 0)
tmux select-pane -t .1

# send to session, only 1 window, 2nd pane cmd to open nvim
tmux send-keys -t .1  "nvim" C-m

# return to pane 0
tmux select-pane -t .0

# get to work
tmux attach-session -t $S 

# here https://www.peterdebelak.com/blog/tmux-scripting/

# -----------------------
#	tests:   tmux running?
# -----------------------

#!/bin/bash
# 012_test_tmux.sh

gap="\n"
#######################
#	TMUX Running?
#	older method
#### TMUX Running? ####
if [ -n "$TMUX" ]
then
	echo $TMUX
else
	echo "TMUX not running"
fi

########################
#		Best method [[   ]]
#		(zsh - use this)
########################
if [[ -n "$TMUX" ]]
then
	echo "TMUX running:   $TMUX"
else
	echo "$TMUX not running"
fi

########################
#	using test
#
########################
if test -n "$TMUX" 
then
	echo "TMUX running:   $TMUX"
else
	echo "$TMUX not running"
fi


########################
#		Echo examples
#
#
########################

echo "1 $gap"
echo $'gap'
echo -e $gap			# works
echo "4...${gap}"		# works
printf "5 $gap"			# works

