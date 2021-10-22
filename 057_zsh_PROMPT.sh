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

# NOTES
# 5 SEP 2021
#       Do not understand what controls PS1; different inside a script?
#       Can even save original $PS1 into variable.


## use colors
  autoload -U colors && colors 



  # Needs to be on
  setopt prompt_subst

  # Save old prompt
  #     OLD_PROMPT=$PROMPT
  # echo $OLD_PROMPT

  function myprompt {
      local rc=$reset_color
      export PS1="%F{cyan}%n%{$rc%}"
  }

  myprompt

  echo $PROMPT
  echo $PS1     
  echo "hello"
  exit 1


PS1='%n@%m %F{red}%/%f $ ' # david@macbook /tmp $

exit

PROMPT='%h'
# =========
## LEGACY
# =========
#OLD_PROMPT="$1"

# so use this one
OLD_PROMPT='#%{$fg_bold[grey]%}[%{$reset_color%}%{$fg_bold[${host_color}]%}%n@%m%{$reset_color%}%{$fg_bold[grey]%}]%{$reset_color%}
#%{$fg_bold[blue]%}%10c%{$reset_color%} $(git_prompt_info) $(git_remote_status)
#%{$fg_bold[cyan]%}❯%{$reset_color%} '

case $1 in
	1)
		echo "%{$fg_bold[grey]%}"
		;;
20)

function print-array-collection() {
    autoload -Uz colors && colors # See Note 3.
    local array_name=$1

local array_length=${#${(P)${array_name}}}
for (( i = 1; i < $array_length; i+=3 )) do

  print -P %{${fg[red]}%}${(P)${array_name}[i]}%{$reset_color             %}${(P)${array_name}[i+1]} %{${fg[yellow]}%}${(P)${array_name}[i+2]}%{$reset_color%}
    done
}

print-array-collection ${fg[*]}
;;
30)
	# Works!
	# tests with print -P 
	print -P '%? %h %i %(47t.Ding!.%D{%L:%M}) '
	;;
	*)
		echo "usage"
esac

