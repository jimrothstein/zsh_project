#!/bin/zsh
#	FILE: 038_get_PID.sh
#	PURPOSE:  FORK vs SOURCe
#	SOURCE:	URBAN PENGUINEs see youtube.com
# ----------------------------

case $1 in 
	1)
		#	FORK - new PID
		echo $$			# get PID
		#	
		#	var will not be  in envn
		user_name=joe
		echo $user_name

		#	but SOURCE , will be SAME PID, and user_name will be in env!

		set -x
		f ()
		echo $#

		f 1 2 3 4 5
		set +x
	;;

	2)
		grep -E jim /etc/passwd		# returns info
		grep -E jim1 /etc/passwd	# displays nothing since no jim1.
		;;
	3)	# q=quiet
		grep -Eq jim /etc/passwd; echo $?	# 0
		grep -Eq jim1 /etc/passwd; echo $?  # 1	
	;;
	4)
		# instead of quiet
		grep -E jim /etc/passwd 1>/dev/null 2>&1; echo $?	# 0
		grep -E jim1 /etc/passwd 1>/dev/null 2>&1; echo $?   # 1	
	;;
5)
		if test $(date +%m) -eq 04
		then
			echo "true"
		else
			echo "false"
		fi
		;;
	6)
		echo {1..9}
		echo {1..9}.fake
		;;
	7)
		echo {1..9}.fake | xargs		# default is just print
		echo {1..9}.fake | xargs -n1	# process 1 at time
		echo {1..9}.fake | xargs -n3	# 3 at time
		;;
esac


