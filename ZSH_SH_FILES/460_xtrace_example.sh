#!/bin/zsh -xv
# ----------------------------
#	file <- "460_xtrace_example.sh"

#	PURPOSE:		Zsh shell script:  demonstrate -xv flags  (-x xtrace, -v verbose)
#							prints info before each line executed.   Uses $PS4 for
#							formatting.

#	USAGE:			Either #!/bin/zsh -xv as first line and run as .\<script.sh>
#							Or,  zsh -xv  <script.sh>
#

#	Step 1, at CLI (BEFORE running this script)
#	export PS4="+%1N:%I]      "

#	Step 2
#	zsh -x ./460_xtrace_example.sh

f() {
    echo "hello"
    exit 2 
}


f
