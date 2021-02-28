#  ~/code/scripts_/bash_script_play/helloFile

# -------------
# hello is zsh function
# 	USE:  > hello
# 				(1) directory must be in fpath (see .zshrc)
#	  			(2) must have :   set autoload -Uz helloFile (see .zshrc)
# -------------
#

hello () {
	printf 'Hello World\n'
}

hello2 () {
	printf 'Hello World2\n'
}

