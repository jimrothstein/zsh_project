###	file <- "058_prompt_examples.md"

==============================================
		PURPOSE:	Examples of possible PROMPT strings

		USAGE:		Set up neovim terminal:  ,tl to send line to terminal
==============================================


####	Save old
OLD_PROMPT=$PROMPT
####	Try out prompt
print -P %h
print -P %t

print -P %D{%L:%M}

#	line#, last error status
print -P '%h|%t|%?'


#	%F ... %f  start/stop a string
print -P '%h_%n@%m %F{red}%/%f $ '

print -P '%h_%n@%m %F{grey}%/%f $ '
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
exit


### another method:
## include colors
#autoload -U colors && colors 

## method 1 (works) , but duplicates in zstyle

# PS1='%h_%n@%m %F{red}%/%f $ '
# exit


# %h  = comand no
# %n@%m = user@machine
# %F{red} = begin color red
# %/
# %f = end color
