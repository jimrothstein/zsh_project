#!/bin/zsh

# 014_command_sub.sh

# Wed Jan 16 19:18:51 PST 2019
# :r !cmd  ex:	:r !date (to insert date)

###########################
#	Command Substitution
#
#	if cmd is command,  $(cmd) is correct way to embed
#	EX:  echo "my name is $(cmd)"
###########################

# old way
textfile_listing=`ls *`			# Note, quoted
INCLUDE=FALSE

if [[ INCLUDE == TRUE ]]
then

# Variable contains names of all * files 
echo "${textfile_listing}"			# works
echo $textfile_listing				# works, but different format!
fi


# new way
if [[ INCLUDE == TRUE ]]
then
# note form: $(cmd)
textfile_listing2=$(ls *)   # The alternative form of command substitution.
x=${ls *}					#Bad substitution!   error

echo $textfile_listing2				# works
echo "${textfile_listing2}"			# works, but better format!
# Same result.
fi

##############################3
#	embed shell cmd
#
##############################
if [[ INCLUDE == TRUE ]]
then
# correct way
echo "my name is $(whoami)"			# new way  works	
echo "my name is `whoami`"		# OLD way {my name is jim}i


# assorted varions
echo "my name is ${whoami}"			# my name is      #blank
echo "${my_name=`whoami`}"				# jim, defined a variable!
echo $my_name							# jim


#note	FAIL!
echo "cleanest: my name  is ${`whoami`}" # bad substitution
echo "${my name is `whoami`}"			# bad substitution

# more examples
# old
n=`who|wc -l`
echo "$n"								# 0 (who returns 0)

# new									# 0
m=$(whoami|wc -l)						# 1
echo "${m}"

# old
x=`date`
echo "today is $x"						# today is Sat Aug 11 14:58 .....:
# new
y=$(date)
echo "today is ${y}"					# works, as line above

fi
