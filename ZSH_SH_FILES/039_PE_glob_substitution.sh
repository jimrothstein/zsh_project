
#!/bin/zsh
# ----------------------------
#	FILE:		039_PE_glob_substitution.sh
#   PURPOSE:  	PE - simple examples & using GLOB substitution
#   SEE ALSO:  woolridge: https://mywiki.wooledge.org/BashFAQ/073
# ----------------------------

a=(alpha beta gammma)

case $1 in
	1)
		;;
	2)
# -------------
# PE, arrays,  some GLOBs, not regexp
# -------------
# a[@]  all elemnts
# chop from begining
echo "${a[@]#a}"	#lpha beta gamma

echo "${a[@]%a}"	#alph bet gamm (from right)
;;
21)
# begin substitution
echo "${a[@]/a/f}"	# flpha betf gfmma 1st a in EACH element

echo "${a[@]//a/f}"	# all a's (EACH word)
# flphf betf gfmmmf

echo "${a[@]/#a/f}"   # substitute a for f , from left 
#flpha beta gamma

echo "${a[@]/#a/f}" 	# greedy, from left

echo "${a[@]/%a/f}"   #	from right, each element 
#alphf betf gammf
;;
22)
	# begin glob 
b=(123alpha 456beta 789gamma)
echo "${b[@]/[0-9]/}"    #23alpha 56beta 89gamma
echo "${b[@]//[0-9]/}"   # greedy   alpha beta gamma

echo "${b[@]/[0-9]{2}/}"    #nope! (expect: 3alpha 6beta 9gamma)
	;;
3) # WORKs (here regex does work)
		f="123456text.txt"
		re="^[0-9]{4,6}"
		[[ $f =~ ${re} ]]; echo $?		# f contain regex re?
		g="123text.txt"
		[[ $g =~ ${re} ]]; echo $?		# this fails (expected)
		;;

	4)	# FAILS
		f="123456text.txt"
		re="^[0-9]{4,6}"
		print "${f/${~re}/z}"
		;;

	*)	echo "usage: zsh % 1|2|3|4| "
esac


