#!/usr/bin/zsh
# ----------------------------
#       file <- "057_zsh_PROMPT.sh#"
# 	DIR:	/home/jim/code/zsh_scripts_project
# ----------------------------
# 	USAGE:	
#   PURPOSE:  	try out prompts in ZSH
#   SEE ALSO:   ~/.config/zsh/prompt.zsh 
# ----------------------------
# -----------------------
#	PLAY WITH PROMPT
# -----------------------
# Load version control information
#
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats 'on branch %b'
 
# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
export PROMPT='%n in ${PWD/#$HOME/~} ${vcs_info_msg_0_} > '

exit	
#	NOTES
;aldfj


