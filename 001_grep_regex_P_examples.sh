#!/bin/zsh

#   PURPOSE:   EXAMPLES of GREP and regex (-P = Perl)
#   USAGE:    ./001....  >> file.txt
#
#   :vsplit term://zsh
#
str="hello"
line_break="-------------------"
r="h"
echo $str | grep -E "$r" -
regex='\d(?=x)'

## GREP --color=always is now in the alias for grep
## SEE $ZSH alias
## hmmmm,  seems need to put it in here ... ???
alias grep='grep --color=always'

echo ${line_break}
echo "so 3512471"
str='animal=cat,dog,cat,'
echo $str
regex='(?:animal)(?:=)(\w+)(,)(?:.*)\1\2'
echo ${regex}
echo $str | grep -P $regex
echo 'animal=dog,cat,dog,deer,dog,' | grep -P $regex




echo ${line_break}
echo "Find Judith followed somewhere by digit"
echo "Judith is 10 on scale of 10!"  | grep -P 'Judith(?=.*?[0-9])'


echo ${line_break}
regex='Judith(?=.*?[0-9])'
echo ${regex}
echo "Judith is 10 on scale of 10!"  | grep -P ${regex} 

echo ${line_break}
echo "Find digits"
echo "Judith is 10 on scale of 10!"  | grep -P '\d'
echo "judy is 3" | grep -P '\d'



echo ${line_break}
echo "digit IF followed by somewhere by x"
echo "3 ....a ...a" | grep -P '\d(?=.*x)'
echo "3 ....x ...x" | grep -P '\d(?=.*x)'

echo ${line_break}
echo "digit IF followed immediately by x"
echo "A: 3 ....x ...x" | grep -P '\d(?=x)'
echo "B: ....3x ...x" | grep -P '\d(?=x)'


echo ${line_break}
echo "Match x and digits in either order; C does not match"
echo "B works because followed by is zero width; sees x, so it meets criteria"
echo "C does not"

echo "A: ...x3"  | grep -P '^(?=.*x).*\d'
echo "B: ...3x"  | grep -P '^(?=.*x).*\d'
echo "C: ...3"  | grep -P '^(?=.*x).*\d'

echo ${line_break}
echo "to be or not to be" | grep -P '(to)(be) or not \1 \2'
echo "to be or not to be" | grep -P '(to)(be)(?:or not) \1 \2'

echo "2021-12-13" | grep -P '(\d{4})-(\d{2})'
echo "2021-12-13" | grep -P '(\d{4})-\d{2}\1'

echo "2021-12-13" | grep -P '(\d{4})-(\d{2})-(\d{2})\3' #MONTH\1'


#--------------
#  LOOKAROUNDS
#--------------
#
#
echo ${line_break}
echo "a followed by c"
echo 'a(?=c)'
str=bacad
echo $str | grep -P 'a(?=c)'

echo ${line_break}
echo "a NOT followed by c"
echo 'a(?!c)'
str=bacad
echo $str | grep -P 'a(?!c)'


echo ${line_break}
echo "a preceeded by by b"
reg='(?<=b)a'
echo $reg
str=bacad
echo $str | grep -P '(?<=b)a'


# LOOK AROUNDS : do not capture
echo " " 
reg='(?<=costs)\s\d\.\d{2}'
echo "Penguin costs 2.99, and whale costs 5.99 but I only have 2.01 left"
echo "Penguin costs 2.99, and whale costs 5.99 but I only have 2.01 left" | grep -P $reg

echo " " 
reg='\w+\s(?=costs)'
echo "Penguin costs 2.99, and whale costs 5.99 but I only have 2.01 left"
echo "Penguin costs 2.99, and whale costs 5.99 but I only have 2.01 left" | grep -P $reg




echo ${line_break}
echo "a NOT preceeded by by b"
reg='(?<!b)a'
echo $reg
str=bacad
echo $str | grep -P '(?<!b)a'

echo ${line_break}
echo "Precendent"
reg='((ab|d)e)'
echo $reg
str=bacade
echo $str | grep -P '((ab|d)e)' 


echo ${line_break}
echo "Alternative"
reg='(ab|d)e'
echo $reg
str=bacade
echo $str | grep -P '(ab|d)' 

