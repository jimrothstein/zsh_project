ZSH manual Chapter 15 defines variable as:

-	parameter whose name begins with an alphanumeric or underscore is also
referred to as a variable.


-	The attributes of a parameter determine the type of its value, often referred to as the parameter type or variable type, and also control other processing that may be applied to the value when it is referenced. 

I am trying to write code check very basic attributes of a variable an

-	So for example, ${VAR-"not set"} works:


51)


is_param_set(){
	x=$1
	echo $x
	return=${x-"not set"}
	echo ${return}
	if [[ $return != "not set" ]]
	then
		echo "set"
	else
		echo "not set"
	fi
}
unset y
y=
echo ${y-"not set"}
is_param_set $y
;;
